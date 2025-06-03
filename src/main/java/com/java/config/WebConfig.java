package com.java.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Ví dụ: nếu ảnh được lưu trong thư mục: /src/main/webapp/uploads/
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations("/uploads/");
        
        // Nếu bạn lưu file theo đường dẫn thực ngoài project, dùng:
        // registry.addResourceHandler("/uploads/**")
        //         .addResourceLocations("file:/đường/dẫn/tuyệt/đối/tới/uploads/");
    }
}
