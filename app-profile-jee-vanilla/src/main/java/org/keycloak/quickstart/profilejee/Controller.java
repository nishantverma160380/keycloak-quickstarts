/*
 * Copyright 2016 Red Hat, Inc. and/or its affiliates
 * and other contributors as indicated by the @author tags.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.keycloak.quickstart.profilejee;

import org.keycloak.KeycloakSecurityContext;
import org.keycloak.representations.IDToken;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Controller simplifies access to the server environment from the JSP.
 *
 * @author Stan Silvert ssilvert@redhat.com (C) 2015 Red Hat Inc.
 */
public class Controller {

    public void handleLogout(HttpServletRequest req) throws ServletException {
        if (req.getParameter("logout") != null) {
            req.logout();
        }
    }

    public boolean isLoggedIn(HttpServletRequest req) {
        return req.getUserPrincipal() != null;
    }

    public String getUserDetails(HttpServletRequest req) {
        String nhsNo ="";
        KeycloakSecurityContext session = (KeycloakSecurityContext) req.getAttribute(KeycloakSecurityContext.class.getName());

        /*AccessToken accessToken = session.getToken();
        accessToken.getAuthorization();*/

        IDToken idToken = session.getIdToken();
        req.setAttribute("email",idToken.getEmail());
        req.setAttribute("username",idToken.getPreferredUsername());
        req.setAttribute("fullName",idToken.getName());
        req.setAttribute("first",idToken.getGivenName());
        req.setAttribute("last",idToken.getFamilyName());

        Map<String, Object> otherClaims = idToken.getOtherClaims();
        if (otherClaims.containsKey("nhsNumber")) {
            nhsNo = String.valueOf(otherClaims.get("nhsNumber"));
        }
        req.setAttribute("nhsNo",nhsNo);
        //otherClaims.foreach((k,v) -> System.out.println("Item : " + k + " Value : " + v));
        /*for (Map.Entry<String, Object> entry : otherClaims.entrySet()) {
            System.out.println("Item : " + entry.getKey() + " Count : " + entry.getValue());
        }*/

        return nhsNo;
    }

}
