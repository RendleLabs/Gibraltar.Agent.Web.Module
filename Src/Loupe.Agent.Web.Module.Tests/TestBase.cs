﻿using System;
using System.Collections;
using System.IO;
using System.Security.Principal;
using System.Web;
using Loupe.Agent.Web.Module.Handlers;
using NSubstitute;
using NUnit.Framework;

namespace Loupe.Agent.Web.Module.Tests
{
    public class TestBase
    {
        protected const string LogUrl = "http://www.test.com/loupe/log";
        protected const string LoupeCookieName = "LoupeSessionId";

        protected HttpContextBase HttpContext;
        protected HttpRequestBase HttpRequest;
        protected HttpResponseBase HttpResponse;
        protected MessageHandler Target;
        protected MemoryStream InputStream;
        protected IPrincipal FakeUser;
        protected IIdentity FakeIdentity;
        protected string DefaultTestSessionId;
        protected string DefaultAgentSessionId;
        protected Hashtable contextItems;

        [SetUp]
        public void BaseSetUp()
        {
            Target = new MessageHandler();

            HttpContext = Substitute.For<HttpContextBase>();
            HttpRequest = Substitute.For<HttpRequestBase>();
            HttpResponse = Substitute.For<HttpResponseBase>();

            InputStream = new MemoryStream();
            HttpRequest.InputStream.Returns(InputStream);
            

            FakeUser = Substitute.For<IPrincipal>();
            FakeIdentity = Substitute.For<IIdentity>();
            FakeIdentity.Name.Returns("");
            FakeUser.Identity.Returns(FakeIdentity);

            HttpRequest.HttpMethod.Returns("POST");
            DefaultTestSessionId = Guid.Empty.ToString();
            DefaultAgentSessionId = "8C6005BE-D7A9-46C1-BE7C-49228903A540";

            contextItems = new Hashtable();
            SetContextLoupeSessionId(DefaultTestSessionId);
            SetContextAgentSessionId(DefaultAgentSessionId);

            HttpContext.Items.Returns(contextItems);
            HttpContext.Request.Returns(HttpRequest);
            HttpContext.Response.Returns(HttpResponse);
            HttpContext.User.Returns(FakeUser);            
        }

        [TearDown]
        public void TearDown()
        {
            InputStream.Dispose();
        }

        protected void ClearLoupeSessionIdValue()
        {
            SetContextLoupeSessionId("");
        }

        protected void SetContextLoupeSessionId(string value)
        {
            contextItems["LoupeSessionId"] = value;
        }

        protected void SetContextAgentSessionId(string value)
        {
            contextItems["LoupeAgentSessionId"] = value;
        }

        protected void SendRequest(string body)
        {
            using (var writer = new StreamWriter(InputStream))
            {
                writer.Write(body);
                writer.Flush();


                HttpRequest.Url.Returns(new Uri(LogUrl));
                HttpRequest.InputStream.Returns(InputStream);

                Target.HandleRequest(HttpContext);
            }            
        }
    }
}