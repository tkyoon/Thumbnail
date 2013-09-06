<%@ page import="java.io.*,
                java.awt.*,
                java.awt.image.*,
                javax.swing.*,
                com.sun.image.codec.jpeg.*"
    contentType="text/html;charset=MS949" %>
<%!
    public static void createThumbnail(String soruce, String target, int targetW) throws Exception
    {
        Image imgSource = new ImageIcon(soruce).getImage();

        int oldW = imgSource.getWidth(null);
        int oldH = imgSource.getHeight(null);

        int newW = targetW;
        int newH = (targetW * oldH) / oldW;

        Image imgTarget = imgSource.getScaledInstance(newW, newH, Image.SCALE_SMOOTH);

        int pixels[] = new int[newW * newH];

        PixelGrabber pg = new PixelGrabber(imgTarget, 0, 0, newW, newH, pixels, 0, newW);
        pg.grabPixels();

        BufferedImage bi = new BufferedImage(newW, newH, BufferedImage.TYPE_INT_RGB);
        bi.setRGB(0, 0, newW, newH, pixels, 0, newW);

        FileOutputStream fos = new FileOutputStream(target);

        JPEGImageEncoder jpeg = JPEGCodec.createJPEGEncoder(fos);

        JPEGEncodeParam jep = jpeg.getDefaultJPEGEncodeParam(bi);
        jep.setQuality(1, false);

        jpeg.encode(bi, jep);

        fos.close();
    }
%>
<%
    createThumbnail("c:/x.jpg","c:/x_500.jpg",500);
    createThumbnail("c:/x.jpg","c:/x_300.jpg",300);
    createThumbnail("c:/x.jpg","c:/x_150.jpg",150);
    createThumbnail("c:/x.jpg","c:/x_50.jpg",50);
%>