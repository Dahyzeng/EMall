package emall.web.component.store;

import emall.entity.Address;
import emall.service.user.address.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taurin on 2016/4/30.
 */
@Component
@RequestMapping("/address")
public class AddressComponent {
    @Autowired
    private AddressService addressService;

    @Autowired
    HttpServletRequest request;

    @RequestMapping("/edit")
    @ResponseBody
    public Map addOrUpdateAddress(Address address) {
        Map<String, Object> infoMap = checkUserStatus();
        if (!(Boolean)infoMap.get("success")) {
            return infoMap;
        }
        address.setUserId(infoMap.get("userId").toString());
        addressService.addOrUpdateAddress(address);
        return infoMap;
    }

    @RequestMapping("/getAll")
    @ResponseBody
    public Map getUserAddress() {
        Map<String, Object> infoMap = checkUserStatus();
        if (!(Boolean)infoMap.get("success")) {
            return infoMap;
        }
        List addressArray = addressService.getUserAddress(Integer.parseInt(infoMap.get("userId").toString()));
        infoMap.put("addressArray", addressArray);
        return infoMap;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Map deleteAddress(int addressId) {
        Map<String, Object> infoMap = checkUserStatus();
        if (!(Boolean)infoMap.get("success")) {
            return infoMap;
        }
        addressService.deleteAddress(addressId);
        return infoMap;
    }

    public Map<String, Object> checkUserStatus() {
        Object userId = request.getSession().getAttribute("userId");
        Map<String, Object> map = new HashMap<String, Object>();
        if (userId == null) {
            map.put("success", false);
            map.put("errorMessage", "no_login");
        } else {
            map.put("success", true);
            map.put("userId", userId.toString());
        }
        return map;
    }
}
