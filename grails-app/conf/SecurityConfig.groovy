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
    /**/create=ROLE_ADMIN
    /**/edit=ROLE_ADMIN
    /proforma/create=ROLE_ADMIN,ROLE_USER
    /proforma/edit=ROLE_ADMIN,ROLE_USER
    /**=IS_AUTHENTICATED_ANONYMOUSLY
    """

}
