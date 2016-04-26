package emall.web.component.merchant.item;

import emall.entity.CarouselItem;
import emall.service.merchant.item.ItemBaseService;
import emall.service.merchant.item.ItemCarouselService;
import emall.util.file.UploadFile;
import emall.util.string.constants.ErrorMessageConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taurin on 2016/4/16.
 */
@Controller
@RequestMapping("/carousel")
public class CarouselItemComponent {
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private ItemBaseService itemBaseService;

    @Autowired
    private ItemCarouselService itemCarouselService;

    @Autowired
    private UploadFile uploadFile;

    @RequestMapping(value = "/get", method = RequestMethod.GET)
    @ResponseBody
    public Map getCarouse() {
        Map<String, Object> finalMap = new HashMap<String, Object>();
        Object merchantName = request.getSession().getAttribute("merchantName");
        if (merchantName == null) {
            finalMap.put("success", false);
            finalMap.put("errorMessage", ErrorMessageConstant.NO_LOGIN_ERROR);
            return finalMap;
        }
        List carouselList = itemCarouselService.getCarousel();

        finalMap.put("success",true);

        List<Map> carouselMapList = new ArrayList<Map>();
        for (Object carouselItem : carouselList) {
            Map<String, Object> carouselMap = new HashMap<String, Object>();
            if (carouselItem.getClass() != null) {
                CarouselItem item = (CarouselItem) carouselItem;
                String itemName = itemBaseService.getItemNameById(item.getItemId());
                carouselMap.put("itemName", itemName);
                carouselMap.put("picURL", item.getPicURL());
                carouselMap.put("itemId", item.getItemId());
                carouselMapList.add(carouselMap);
            }
        }
        finalMap.put("carouseArray", carouselMapList);
        return finalMap;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addCarousePic(String itemId, MultipartFile file, int sequence) {
        Object merchantName = request.getSession().getAttribute("merchantName");
        if (merchantName == null) {
            return "redirect:/merchant/signIn";
        }
        try {
            String itemName = itemBaseService.getItemNameById(itemId);
            String savePicURL = uploadFile.uploadPic(request, file, "carousel");
            if (itemCarouselService.addCarousel(new CarouselItem(itemId, savePicURL, sequence), itemName) == 1) {
                return "redirect:/merchant/product/carousel/" + itemId + "?success=true";
            } else {
                return "redirect:/merchant/product/carousel/" + itemId + "?success=false";
            }
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/merchant/product/carousel/" + itemId + "?success=false";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map deleteCarouselPic(String itemId, String itemName) {
        Map<String, Object> finalMap = new HashMap<String, Object>();
        Object merchantName = request.getSession().getAttribute("merchantName");
        if (merchantName == null) {
            finalMap.put("success", false);
            finalMap.put("errorMessage", ErrorMessageConstant.NO_LOGIN_ERROR);
            return finalMap;
        }
        if (itemCarouselService.deleteCarousel(itemId, itemName) == 1) {
            finalMap.put("success", true);
        }
        return finalMap;
    }
}
