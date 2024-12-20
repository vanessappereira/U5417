﻿using System;
using System.Web.UI;

namespace projetoLocais
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
                        new ScriptResourceDefinition
                        {
                            Path = "~/scripts/jquery-3.7.1.min.js",
                            DebugPath = "~/scripts/jquery-3.7.1.js",
                            CdnPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-3.7.1.min.js",
                            CdnDebugPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-3.7.1.js"
                        });

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}