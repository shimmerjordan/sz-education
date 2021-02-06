package com.github.shimmerjordan.common.core.utils.okhttp;

import javax.net.ssl.*;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

/**
 * SSLSocketFactory
 *
 * @author shimmerjordan
 * @date 2021/03/12  16:53
 */
public class SSLSocketClient {

    /**
     * 获取这个SSLSocketFactory
     *
     * @return SSLSocketFactory
     * @author shimmerjordan
     * @date 021/03/12 16:54
     */
    public static SSLSocketFactory getSSLSocketFactory() {
        try {
            SSLContext sslContext = SSLContext.getInstance("TLSv1.2");
            sslContext.init(null, getTrustManager(), new SecureRandom());
            return sslContext.getSocketFactory();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 获取TrustManager
     *
     * @return TrustManager
     * @author shimmerjordan
     * @date 2020/12/4 16:55
     */
    private static TrustManager[] getTrustManager() {
        return new TrustManager[]{
                new X509TrustManager() {
                    @Override
                    public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
                    }

                    @Override
                    public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
                    }

                    @Override
                    public X509Certificate[] getAcceptedIssuers() {
                        return new X509Certificate[]{};
                    }
                }
        };
    }

    /**
     * 获取HostnameVerifier
     *
     * @return HostnameVerifier
     * @author shimmerjordan
     * @date 2020/12/4 16:56
     */
    public static HostnameVerifier getHostnameVerifier() {
        return (requestedHost, remoteServerSession) -> requestedHost.equalsIgnoreCase(remoteServerSession.getPeerHost());
    }
}
