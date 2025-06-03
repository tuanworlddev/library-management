package com.java.service;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

@Service
public class CloudinaryService {
    private final Cloudinary cloudinary;

    public CloudinaryService() {
        cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dfvw2zxji",
                "api_key", "867339151654336",
                "api_secret", "xM8C42Rh8b8d9nkzJOa4IJ6zE7U",
                "secure", true
        ));
    }

    public String uploadFile(MultipartFile file) throws IOException {
        Map uploadResult = cloudinary.uploader().upload(file.getBytes(), ObjectUtils.asMap(
                "asset_folder", "image",
                "resource_type", "image"
        ));
        return uploadResult.get("secure_url").toString();
    }
}
