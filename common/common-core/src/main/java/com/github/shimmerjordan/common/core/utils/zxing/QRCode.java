package com.github.shimmerjordan.common.core.utils.zxing;

import jp.sourceforge.qrcode.data.QRCodeImage;

import java.awt.image.BufferedImage;

/**
 * @author shimmerjordan
 * @date 2021/03/22 15:27
 */
public class QRCode implements QRCodeImage {
    BufferedImage bufImg;

    public QRCode(BufferedImage bufImg) {
        this.bufImg = bufImg;
    }

    @Override
    public int getHeight() {
        return bufImg.getHeight();
    }

    @Override
    public int getPixel(int x, int y) {
        return bufImg.getRGB(x, y);
    }

    @Override
    public int getWidth() {
        return bufImg.getWidth();
    }
}

