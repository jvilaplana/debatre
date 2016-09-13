package com.jordiv.debatre

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Debate)
class DebateSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Test that a discussion has the property user"() {
        when: "A discussion is created by the authenticated user"
            User user = new User(username: "test-user", password: "test-password")
            Debate discussion = new Debate(user: user)
        then: "user is set to the discussion"
            discussion.user == user
    }
}
