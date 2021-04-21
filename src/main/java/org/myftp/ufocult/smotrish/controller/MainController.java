package org.myftp.ufocult.smotrish.controller;

import org.myftp.ufocult.smotrish.domain.Channel;
import org.myftp.ufocult.smotrish.domain.User;
import org.myftp.ufocult.smotrish.repos.ChannelRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

@Controller
public class MainController {
    @Autowired
    private ChannelRepo channelRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model
    ) {
        Iterable<Channel> channels = channelRepo.findAll();

        if (filter != null && !filter.isEmpty()) {
            channels = channelRepo.findByName(filter);
        } else {
            channels = channelRepo.findAll();
        }

        model.addAttribute("channels", channels);
        model.addAttribute("filter", filter);

        return "main";
    }

    @PostMapping("/main")
    public String addChannel(
            @AuthenticationPrincipal User user,
            @Valid Channel channel,
            BindingResult bindingResult,
            @RequestParam("file") MultipartFile file,
            Model model
    ) throws IOException {
        channel.setSubc(user);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorMap);
            model.addAttribute("channel", channel);
        } else {
            saveFile(channel, file);

            model.addAttribute("channel", null);

            channelRepo.save(channel);
        }
        Iterable<Channel> channels = channelRepo.findAll();

        model.addAttribute("channels", channels);

        return "main";
    }


    private void saveFile(
            @Valid Channel channel,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));
            channel.setFilename(resultFilename);
        }
    }

    @GetMapping("/user-channels/{user}")
    public String userChannels(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User user,
            Model model,
            @RequestParam(required = false) Channel channel

    ) {
        Set<Channel> channels = user.getChannels();
        model.addAttribute("channels", channels);
        model.addAttribute("channel", channel);
        model.addAttribute("isCurrentUser", currentUser.equals(user));
        return "userChannels";
    }

    @PostMapping("/user-channels/{user}")
    public String updateChannel(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Long user,
            @RequestParam("id") Channel channel,
            @RequestParam("name") String name,
            @RequestParam("number") Integer number,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        if (channel.getSubc().equals(currentUser)) {
            if (!StringUtils.isEmpty(name)) {
                channel.setName(name);
            }
            if (!StringUtils.isEmpty(number)) {
                channel.setNumber(number);
            }
            saveFile(channel, file);
            channelRepo.save(channel);
        }

        return "redirect:/user-channels/" + user;
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/delete/{channel.id}", method = RequestMethod.GET)
    public String channelDel(
            @PathVariable ("channel.id") Long id) {
        channelRepo.deleteById(id);
    return "userChannels";
    }

}