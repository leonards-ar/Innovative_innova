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
    // Added by the Audit-Logging plugin:
    auditLog.auditDomainClassName = 'com.vitaflo.innova.AuditLogEvent'

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
log4j.main = {
    // Example of changing the log pattern for the default console
    // appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}
    appenders {
        console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    }
    
    debug 'grails.plugin.springsecurity',
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



grails.plugin.springsecurity.password.algorithm = 'SHA-256'
grails.plugin.springsecurity.password.hash.iterations = 1
grails.plugin.springsecurity.active = true
grails.plugin.springsecurity.userLookup.userDomainClassName = "com.vitaflo.innova.User"
grails.plugin.springsecurity.userLookup.passwordPropertyName = "passwd"
grails.plugin.springsecurity.authority.className = "com.vitaflo.innova.Role"
// grails.plugin.springsecurity.requestMapClass = "RequestMap"

//Default User
grails.plugin.springsecurity.security.defaultRole = "ROLE_USER"
/**
 * useRequestMapDomainClass to false, so the application will not use the domain class
 * we’ve created
 */
grails.plugin.springsecurity.useRequestMapDomainClass = false

grails.plugin.springsecurity.controllerAnnotations.staticRules = [
        '/home/**':['ROLE_ADMIN','ROLE_USER','ROLE_ACCOUNTANT','ROLE_REPORT'],
        '/auditlog/list':['ROLE_ADMIN'],
        '/user/show':['ROLE_ADMIN'],
        '/user/edit':['ROLE_ADMIN'],
        '/user/list':['ROLE_ADMIN'],
        '/user/create':['ROLE_ADMIN'],
        '/user/showprofile':['ROLE_ADMIN','ROLE_USER'],
        '/user/editprofile':['ROLE_ADMIN','ROLE_USER'],
        '/client/**':['ROLE_ADMIN','ROLE_USER'],
        '/client/create':['ROLE_ADMIN','ROLE_USER'],
        '/client/edit':['ROLE_ADMIN','ROLE_USER'],
        '/clinicalhistory/**':['ROLE_ADMIN','ROLE_USER'],
        '/drug/**':['ROLE_ADMIN','ROLE_USER'],
        '/login/**':['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/pathology/**':['ROLE_USER','ROLE_ADMIN'],
        '/pathology/create':['ROLE_ADMIN'],
        '/pathology/edit':['ROLE_ADMIN'],
        '/patient/**':['ROLE_ADMIN','ROLE_USER'],
        '/patient/create':['ROLE_ADMIN','ROLE_USER'],
        '/patient/edit':['ROLE_ADMIN','ROLE_USER'],
        '/product/**':['ROLE_ADMIN','ROLE_USER'],
        '/proforma/**':['ROLE_ADMIN','ROLE_USER','ROLE_ACCOUNTANT'],
        '/proforma/create':['ROLE_ADMIN','ROLE_USER'],
        '/proforma/edit':['ROLE_ADMIN','ROLE_USER'],
        '/supplier/**':['ROLE_ADMIN','ROLE_USER'],
        '/invoice/**':['ROLE_ADMIN','ROLE_USER','ROLE_ACCOUNTANT'],
        '/invoice/create':['ROLE_ADMIN','ROLE_USER'],
        '/invoice/edit':['ROLE_ADMIN','ROLE_USER'],
        '/purchase/**':['ROLE_ADMIN','ROLE_USER','ROLE_ACCOUNTANT'],
        '/purchase/create':['ROLE_ADMIN','ROLE_USER'],
        '/purchase/edit':['ROLE_ADMIN','ROLE_USER'],
        '/report/**':['ROLE_REPORT','ROLE_ACCOUNTANT'],
        '/report/consolidatedreport':['ROLE_REPORT','ROLE_ACCOUNTANT'],
        '/**/create':['ROLE_ADMIN'],
        '/**/edit':['ROLE_ADMIN'],
        '/emails/**':['ROLE_ADMIN','ROLE_USER'],
        '/remotepatient/**':['permitAll'],
        '/index': ['permitAll'],
        '/error': ['permitAll'],
        '/'  : ['permitAll'],
        '/**': ['permitAll']
]

grails.plugin.springsecurity.useSecurityEventListener = true
grails.plugin.springsecurity.onInteractiveAuthenticationSuccessEvent = {e, appCtx ->
    com.vitaflo.innova.User.withTransaction {
        //def user = com.vitaflo.innova.User.findByUsername(e.source.principal.username)
        def c = com.vitaflo.innova.User.createCriteria();
        def user = c.get{
            fetchMode("countries", org.hibernate.FetchMode.EAGER)
            eq('username', e.source.principal.username)
        }
        def attr = org.springframework.web.context.request.RequestContextHolder?.getRequestAttributes()
        attr.session.countries = user.countries.sort {it.name}
    }
}

