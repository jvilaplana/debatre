package com.jordiv.debatre

import grails.plugin.springsecurity.userdetails.GrailsUser
import org.springframework.security.core.GrantedAuthority
import org.bson.types.ObjectId

class MyUserDetails extends GrailsUser {

    final String givenName
    final String familyName

    MyUserDetails(String username, String password, boolean enabled,
                  boolean accountNonExpired, boolean credentialsNonExpired,
                  boolean accountNonLocked,
                  Collection<GrantedAuthority> authorities,
                  ObjectId id, String givenName, String familyName) {
        super(username, password, enabled, accountNonExpired,
                credentialsNonExpired, accountNonLocked, authorities, id)

        this.givenName = givenName
        this.familyName = familyName
    }
}
