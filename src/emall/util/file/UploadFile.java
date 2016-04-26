package emall.util.file;

import emall.service.merchant.category.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;

/**
 * Created by taurin on 2016/4/16.
 */
@Component
public class UploadFile {
    @Autowired
    private CategoryService categoryService;

    public String uploadPic(HttpServletRequest request, MultipartFile file, String categoryId) throws IOException {
        String filePicURL = request.getSession().getServletContext().getRealPath("/") + "images";
        StringBuilder savePicURL = new StringBuilder("/images/");
        String categoryName;
        if (categoryId.equals("carousel")) {
            categoryName = categoryId;
        } else {
            categoryName = categoryService.getCategoryName(categoryId);
        }
        filePicURL += "/" + categoryName;
        savePicURL.append(categoryName);
        File saveFile = new File(filePicURL);
        if (!saveFile.exists()) {
            saveFile.mkdirs();
        }
        InputStream input = file.getInputStream();
        OutputStream output = new FileOutputStream(saveFile + "/" + file.getOriginalFilename());
        savePicURL.append("/");
        savePicURL.append(file.getOriginalFilename());
        byte[] buffer = new byte[2048];
        int length;
        while ((length = input.read(buffer)) > 0) {
            output.write(buffer, 0, length);
        }
        input.close();
        output.close();
        return savePicURL.toString();
    }

}
