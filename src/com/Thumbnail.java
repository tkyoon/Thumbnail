package com;

import java.io.File;
import java.io.IOException;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.media.jai.codec.ImageCodec;
import com.sun.media.jai.codec.SeekableStream;
import com.sun.media.jai.codec.FileSeekableStream;

public class Thumbnail extends HttpServlet {

	/**
	 * <pre>
	 * 변환 가능한 이미지인지 파일 확장자로 확인
	 * </pre>
	 *
	 * @param filename
	 * @return
	 */
	public static boolean getDecoderCheck(String filename) {
		//System.out.println("@@ getDecoderCheck");
		SeekableStream ss = null;
		File file = null;
		String[] ext = null;
		String[] images = { "gif", "jpg", "jpe", "png", "tiff", "bmp" };
		boolean check = false;

		try {
			//System.out.println("@@ filename = " + filename);

			file = new File(filename);
			ss = new FileSeekableStream(file);
			ext = ImageCodec.getDecoderNames(ss);

			//System.out.println("@@ ext = " + ext);
			for (int i = 0; i < ext.length; i++) {
				for (int j = 0; j < images.length; j++) {
					if (ext[i].indexOf(images[j]) > -1) {
						check = true;
						break;
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		//System.out.println("getDecoderCheck return = " + check);
		return check;
	}

	public static void createImage(HttpServletRequest req, HttpServletResponse res, String filename, int tw, int th, boolean border, String bdColor) throws ServletException, IOException {
		if (getDecoderCheck(filename) == true) {
			res.setContentType("image/png");
			ServletOutputStream out = res.getOutputStream();
			RenderedOp op = JAI.create("fileload", filename);
			BufferedImage im = op.getAsBufferedImage();

			if (im.getWidth() < tw)
				tw = im.getWidth();
			if (im.getHeight() < th)
				th = im.getHeight();

			BufferedImage thumb = new BufferedImage(tw, th, BufferedImage.TYPE_INT_RGB);
			Graphics2D g2d = thumb.createGraphics();

			g2d.drawImage(im, 0, 0, tw, th, null);

			if (border == true) {
				g2d.setColor(Color.decode(bdColor));
				g2d.drawRect(0, 0, --tw, --th);
			}

			ImageIO.write(thumb, "png", out);
			out.close();
		}
	}

	public static void createImage(HttpServletRequest req, HttpServletResponse res, String filename, int zoomOut, boolean border, String bdColor) throws ServletException, IOException {
		//System.out.println("@@ createImage");
		if (getDecoderCheck(filename) == true) {
			res.setContentType("image/png");
			ServletOutputStream out = res.getOutputStream();
			RenderedOp op = JAI.create("fileload", filename);
			BufferedImage im = op.getAsBufferedImage();

			if (zoomOut <= 0)
				zoomOut = 1;

			int tw = im.getWidth() / zoomOut;
			int th = im.getHeight() / zoomOut;

			BufferedImage thumb = new BufferedImage(tw, th, BufferedImage.TYPE_INT_RGB);
			Graphics2D g2d = thumb.createGraphics();

			g2d.drawImage(im, 0, 0, tw, th, null);

			if (border == true) {
				g2d.setColor(Color.decode(bdColor));
				g2d.drawRect(0, 0, --tw, --th);
			}

			ImageIO.write(thumb, "png", out);
			out.flush();
			out.close();
		}
	}

	public static void createImage(String loadFile, String saveFile, int tw, int th, boolean border, String bdColor) throws ServletException, IOException {
		if (getDecoderCheck(loadFile) == true) {
			File save = new File(saveFile);
			RenderedOp op = JAI.create("fileload", loadFile);
			BufferedImage im = op.getAsBufferedImage();

			if (im.getWidth() < tw)
				tw = im.getWidth();
			if (im.getHeight() < th)
				th = im.getHeight();

			BufferedImage thumb = new BufferedImage(tw, th, BufferedImage.TYPE_INT_RGB);
			Graphics2D g2d = thumb.createGraphics();

			g2d.drawImage(im, 0, 0, tw, th, null);

			if (border == true) {
				g2d.setColor(Color.decode(bdColor));
				g2d.drawRect(0, 0, --tw, --th);
			}

			ImageIO.write(thumb, "png", save);
		}
	}

	public static void createImage(String loadFile, String saveFile, int zoomOut, boolean border, String bdColor) throws ServletException, IOException {
		if (getDecoderCheck(loadFile) == true) {
			File save = new File(saveFile);
			RenderedOp op = JAI.create("fileload", loadFile);
			BufferedImage im = op.getAsBufferedImage();

			if (zoomOut <= 0)
				zoomOut = 1;

			int tw = im.getWidth() / zoomOut;
			int th = im.getHeight() / zoomOut;

			BufferedImage thumb = new BufferedImage(tw, th, BufferedImage.TYPE_INT_RGB);
			Graphics2D g2d = thumb.createGraphics();

			g2d.drawImage(im, 0, 0, tw, th, null);

			if (border == true) {
				g2d.setColor(Color.decode(bdColor));
				g2d.drawRect(0, 0, --tw, --th);
			}

			ImageIO.write(thumb, "png", save);
		}
	}
}
