package com.todaylesson.csrf;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import javax.servlet.ServletOutputStream;
import javax.servlet.WriteListener;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class HtmlResponseWrapper extends HttpServletResponseWrapper{
	
	private final ByteArrayOutputStream capture;
    private ServletOutputStream output;
    private PrintWriter writer;

	public HtmlResponseWrapper(HttpServletResponse response) {
		super(response);
		// TODO Auto-generated constructor stub
		capture = new ByteArrayOutputStream(response.getBufferSize());
	}
	
	@Override

    public ServletOutputStream getOutputStream() {

        if (writer != null) {

            throw new IllegalStateException(

                    "getWriter() has already been called on this response.");

        }

 

        if (output == null) {

            output = new ServletOutputStream(){

                @Override
                public void write(int b) throws IOException {

                    capture.write(b);

                }

                @Override
                public void flush() throws IOException {

                    capture.flush();

                }

                @Override
                public void close() throws IOException {

                    capture.close();

                }
                //아래두개는 사이트에 없었음
                @Override
				public void setWriteListener(WriteListener arg0) {
					// TODO Auto-generated method stub
					
				}
				
				@Override
				public boolean isReady() {
					// TODO Auto-generated method stub
					return false;
				}

            };

        }

        return output;

    }

 

    @Override

    public PrintWriter getWriter() throws IOException {

        if (output != null) {

            throw new IllegalStateException(

                    "getOutputStream() has already been called on this response.");

        }

        if (writer == null) {

            writer = new PrintWriter(new OutputStreamWriter(capture,

                    getCharacterEncoding()));
        }

        return writer;

    }



    @Override

    public void flushBuffer() throws IOException {

        super.flushBuffer();

 

        if (writer != null) {

            writer.flush();

        } else if (output != null) {

            output.flush();

        }

    }

 

    public byte[] getCaptureAsBytes() throws IOException {

        if (writer != null) {

            writer.close();

        } else if (output != null) {

            output.close();

        }

 

        return capture.toByteArray();

    }

 

    public String getCaptureAsString() throws IOException {

        return new String(getCaptureAsBytes(), getCharacterEncoding());

    }

}
