﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Loupe.Agent.Web.Module.WebFormTest._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<div class="row">
    <h1>Loupe Javascript Agent</h1>
    <p class="lead">
        The Loupe Javascript logging &amp; exception reporting consists of two parts, a .Net Http Module and a JavaScript agent
        which you can find <a href="https://github.com/GibraltarSoftware/Gibraltar.Agent.Web.JavaScript">here</a>
    </p>
</div>

<div class="row">
    <h3>Session Ids</h3>
    <p>ClientId (from cookie): <%= SessionId %></p>
    <p>Agent session Id: <span id="AgentSessionId"></span></p>
    <p>Log sequence number: <span id="sequenceNumber"></span></p>
</div>

<div class="row">
    <div>
        <h3>Logging</h3>
        <div class="form-horizontal col-md-12">
            <div class="form-group">
                <label class="control-label col-md-2" for="categoryInput">Category</label>
                <div class="col-md-10">
                    <input type="text" id="categoryInput" class="form-control"/>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-md-2" for="captionInput">Caption</label>
                <div class="col-md-10">
                    <input type="text" id="captionInput" class="form-control"/>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-md-2" for="descriptionInput">Description</label>
                <div class="col-md-4">
                    <input type="text" id="descriptionInput" class="form-control"/>
                </div>
                <label class="control-label col-md-1" for="parametersInput">Parameters</label>
                <div class="col-md-4">
                    <input type="text" id="parametersInput" class="form-control"/>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-md-2" for="detailsInput">Details</label>
                <div class="col-md-10">
                    <input type="text" id="detailsInput" class="form-control"/>
                </div>
            </div>
            <div class="col-md-12">
                <div class="col-md-offset-1">
                    <div class="form-group">
                        <p class="form-control-static col-md-6">Method Source Info</p>
                        <p class="form-control-static col-md-2">Exception</p>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="fileInput">Filename</label>
                        <div class="col-md-4">
                            <input type="text" id="fileInput" class="form-control"/>
                        </div>

                        <label class="control-label col-md-2" for="exceptionMessageInput">Message</label>
                        <div class="col-md-4">
                            <input type="text" id="exceptionMessageInput" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="methodInput">method</label>
                        <div class="col-md-10">
                            <input type="text" id="methodInput" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="fileInput">line</label>
                        <div class="col-md-10">
                            <input type="number" id="lineInput" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="columnInput">Column</label>
                        <div class="col-md-10">
                            <input type="number" id="columnInput" class="form-control"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <h4>Log as:</h4>
            <div class="col-md-12">
                <div class="control col-md-5">
                    <button id="logVerbose" class="btn btn-primary">Verbose</button>
                    <button id="logInfo" class="btn btn btn-success">Information</button>
                    <button id="logWarning" class="btn btn btn-info">Warning</button>
                    <button id="logError" class="btn btn btn-warning">Error</button>
                    <button id="logCritical" class="btn btn btn-danger">Critical</button>
                </div>
                <div class="col-md-7">
                    <div class="col-md-2">
                        <button id="logWrite" class="btn btn btn-default">Log using</button>
                    </div>
                    <div class="col-md-5">
                        <select id="severity" class="form-control">
                            <option value="0">Select severity</option>
                            <option value="16">Verbose</option>
                            <option value="8">Information</option>
                            <option value="4">Warning</option>
                            <option value="2">Error</option>
                            <option value="1">Critial</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <h3>Exception</h3>
    <div class="col=md-12">
        <p class="col-md-3">Throw an unhandled exception</p>
        <div class="col-md-2">
            <button id="unhandledException" class="btn btn-default">Throw</button>
        </div>
    </div>
</div>

<div class="row">
    <h3>Standard call</h3>
    <div class="col=md-12">
        <p class="col-md-3">Make ajax rquest with header</p>
        <div class="col-md-2">
            <button id="ajaxCall" class="btn btn-default">Make Request</button>
        </div>
        <p class="col-md-5">Call result: <span id="ajaxCallResult"></span></p>
    </div>

</div>

</asp:Content>
