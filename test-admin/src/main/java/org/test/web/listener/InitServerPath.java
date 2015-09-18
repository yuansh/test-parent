package org.test.web.listener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;

import org.test.utilities.TiresomeUtils;

public class InitServerPath implements ServletRequestListener {

	@Override
	public void requestDestroyed(ServletRequestEvent sre) {
		TiresomeUtils.setServerPath(sre.getServletRequest());
	}

	@Override
	public void requestInitialized(ServletRequestEvent sre) {
	}

}
