// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if(System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text/plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      pdf: 'application/pdf',
                      excel: 'application/vnd.ms-excel',
                      ods: 'application/vnd.oasis.opendocument.spreadsheet',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]
// The default codec used to encode data with ${}
grails.views.default.codec="html" // none, html, base64
grails.views.gsp.encoding="UTF-8"
grails.converters.encoding="UTF-8"

grails.gsp.enable.reload = true
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true

// set per-environment serverURL stem for creating absolute links
        application.emailFromAddress = "Innova-Sistema@vitaflo.com.ar"
        application.name = "Innovative"
        application.cssFile = "innova.css"
        application.logoFile = "innovative-logo.gif"
        application.template = "templateInnova"
        application.favicon = "innova-favicon.ico"
        application.urls = ["http://localhost:8082/innova","http://localhost:8082/innova","http://localhost:8084/innova"]
        
environments {
    vitaflo {
        grails.serverURL = "http://www.changeme.com"
        grails.app.context = "/vitaflo"
        application.emailFromAddress = "Vitaflo-Sistema@vitaflo.com.ar"
        application.name = "Vitaflo"
        application.cssFile = "vitaflo.css"
        application.logoFile = "vitaflo-logo.gif"
        application.template = "templateVitaflo"
        application.favicon = "vitaflo-favicon.ico"
        application.urls = ["http://localhost:8080/innova", "http://localhost:8080/medgen"]
    }
    innova {
        grails.serverURL = "http://www.changeme.com"
        grails.app.context = "/innova"
        application.emailFromAddress = "Innova-Sistema@vitaflo.com.ar"
        application.name = "Innovative"
        application.cssFile = "innova.css"
        application.logoFile = "innovative-logo.gif"
        application.template = "templateInnova"
        application.favicon = "innova-favicon.ico"
        application.urls = ["http://localhost:8080/vitaflo", "http://localhost:8080/medgen"]
    }
    production {
        grails.serverURL = "http://www.changeme.com"
    }
    development {
        grails.serverURL = "http://localhost:8080/${appName}"
    }
    test {
        grails.serverURL = "http://localhost:8080/${appName}"
    }

}

// Audit log
auditLog {
    verbose = false
}

fckeditor {
    
    upload {
        basedir = ""
        baseurl = ""
        overwrite = false
        link {
            browser = false
            upload = false
            allowed = []
            denied = ['html', 'htm', 'php', 'php2', 'php3', 'php4', 'php5',
                      'phtml', 'pwml', 'inc', 'asp', 'aspx', 'ascx', 'jsp',
                      'cfm', 'cfc', 'pl', 'bat', 'exe', 'com', 'dll', 'vbs', 'js', 'reg',
                      'cgi', 'htaccess', 'asis', 'sh', 'shtml', 'shtm', 'phtm']
        }
        image {
            browser = false
            upload = false
            allowed = ['jpg', 'gif', 'jpeg', 'png']
            denied = []
        }
        flash {
            browser = false
            upload = false
            allowed = ['swf']
            denied = []
        }
        media {
            browser = false
            upload = false
            allowed = ['mpg','mpeg','avi','wmv','asf','mov']
            denied = []
        }
    }
}


// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console
    // appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}
    appenders {
        console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    }
    
    debug 'org.acegisecurity',
          'com.vitaflo.innova'
    
    error  'org.codehaus.groovy.grails.web.servlet',  //  controllers
	       'org.codehaus.groovy.grails.web.pages', //  GSP
	       'org.codehaus.groovy.grails.web.sitemesh', //  layouts
	       'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
	       'org.codehaus.groovy.grails.web.mapping', // URL mapping
	       'org.codehaus.groovy.grails.commons', // core / classloading
	       'org.codehaus.groovy.grails.plugins', // plugins
	       'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
	       'org.springframework',
	       'org.hibernate'

    warn   'org.mortbay.log'
}

//log4j.logger.org.springframework.security='off,stdout'

//Mail Plugin Configuration
grails {
   mail {
     host = "mail.mindpool-it.com"
     port = 587
     username = "labs+mindpool.com.ar"
     password = "java1234"
     props = ["mail.smtp.auth":"true", 					   
//              "mail.smtp.socketFactory.port":"587",
//              "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
              "mail.smtp.socketFactory.fallback":"false"]

} }
