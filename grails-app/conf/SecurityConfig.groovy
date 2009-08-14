security {

    // see DefaultSecurityConfig.groovy for all settable/overridable properties

    active = true

    loginUserDomainClass = "User"
    authorityDomainClass = "Role"
    requestMapClass = "RequestMap"

    //Default User
    security.defaultRole = "ROLE_USER"
    /**
     * useRequestMapDomainClass to false, so the application will not use the domain class
     * we’ve created
     */
    useRequestMapDomainClass = false

    // Sets the URL permissions
    requestMapString = """
    CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
    PATTERN_TYPE_APACHE_ANT
    /home/**=ROLE_ADMIN,ROLE_USER
    /user/show=ROLE_ADMIN
    /user/edit=ROLE_ADMIN
    /user/list=ROLE_ADMIN
    /user/create=ROLE_ADMIN
    /client/**=ROLE_ADMIN,ROLE_USER
    /drug/**=ROLE_ADMIN,ROLE_USER
    /login/**=IS_AUTHENTICATED_ANONYMOUSLY
    /patient/**=ROLE_ADMIN,ROLE_USER
    /product/**=ROLE_ADMIN,ROLE_USER
    /proforma/**=ROLE_ADMIN,ROLE_USER
    /proforma/create=ROLE_ADMIN,ROLE_USER
    /proforma/edit=ROLE_ADMIN,ROLE_USER
    /supplier/**=ROLE_ADMIN,ROLE_USER
    /**/create=ROLE_ADMIN
    /**/edit=ROLE_ADMIN
    /**=IS_AUTHENTICATED_ANONYMOUSLY
    """

}
