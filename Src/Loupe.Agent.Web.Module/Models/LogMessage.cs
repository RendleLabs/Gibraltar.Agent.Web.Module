﻿using System;
using Gibraltar.Agent;
using Newtonsoft.Json;

namespace Loupe.Agent.Web.Module.Models
{
    public class LogMessage
    {
        /// <summary>
        /// Severity of the message
        /// </summary>
        public LogMessageSeverity Severity { get; set; }

        /// <summary>
        /// The category to log against
        /// </summary>
        public string Category { get; set; }

        /// <summary>
        /// The log message caption
        /// </summary>
        public string Caption { get; set; }

        /// <summary>
        /// The log message description
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// Optional. Parameters to be added to the message
        /// </summary>
        public object[] Parameters { get; set; }

        /// <summary>
        /// Optional. Additional details, such as client browser settings
        /// </summary>
        /// <remarks>
        /// This is converted into the XML details
        /// </remarks>
        public string Details { get; set; }

        /// <summary>
        /// Optional. Details of a client side exception
        /// </summary>
        public Exception Exception { get; set; }

        /// <summary>
        /// Information about the method that generated the message
        /// </summary>
        public MethodSourceInfo MethodSourceInfo { get; set; }

        /// <summary>
        /// Specifies when the log message was created on the client
        /// </summary>
        public DateTimeOffset TimeStamp { get; set; }

        /// <summary>
        /// Specifics the sequence number of the message
        /// </summary>
        public long Sequence { get; set; }

    }
}