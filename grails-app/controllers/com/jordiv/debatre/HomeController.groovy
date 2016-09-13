package com.jordiv.debatre

import grails.plugin.springsecurity.annotation.Secured
import com.jordiv.debatre.Debate

class HomeController {
    def springSecurityService

    @Secured(['ROLE_ADMIN', 'ROLE_MOD', 'ROLE_USER'])
    def index() {
        respond Debate.list(max: 5, sort: 'dateCreated', order: 'desc'), model:[debateCount: Debate.count()]
    }

    def register() {

    }

    def saveUser() {
        def username = params?.username

        def password = params?.password

        println username
        println password

        def newUser = new User(username: username, password: password).save(failOnError: true, flush: true)

        println newUser.id

        def roleUser = Role.findByAuthority('ROLE_USER')
        new UserRole(role: roleUser, user: newUser).save(failOnError: true, flush: true)

        redirect action: 'index'
    }
}
