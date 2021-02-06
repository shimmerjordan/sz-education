package com.github.shimmerjordan.common.core.utils;

/**
 * @author shimmerjordan
 * @date 2021/05/26 22:47
 */
public class ObjectUtil {

    /**
     * 将字符串转换为double,如果字符串为空或者null，则自动转换为0.0。
     *
     * @param toConvert 需要转换的字符串
     * @return double
     */
    public static double obj2Double(Object toConvert) {
        if ((toConvert != null) && ((toConvert instanceof Double))) {
            return ((Double) toConvert).doubleValue();
        }
        double d = 0.0D;
        try {
            d = Double.parseDouble(String.valueOf(toConvert));
        } catch (Exception ex) {
        }
        return d;
    }
}
