import com.jordiv.debatre.Role
import com.jordiv.debatre.User
import com.jordiv.debatre.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminRole
        def moderatorRole
        def userRole

        if(Role.list().size() == 0) {
            adminRole = new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
            moderatorRole = new Role(authority: 'ROLE_MOD').save(failOnError: true)
            userRole = new Role(authority: 'ROLE_USER').save(failOnError: true)
        }

        if(User.count() == 0) {
            new User(username: 'admin@debatre.com', password: 'changeme', authorities: [adminRole], givenName: 'Jordi', familyName: 'Vilaplana').save(failOnError: true)
            new User(username: 'mod@debatre.com', password: 'changeme', authorities: [moderatorRole], givenName: 'Jordi', familyName: 'Vilaplana').save(failOnError: true)
            new User(username: 'user@debatre.com', password: 'changeme', authorities: [userRole], givenName: 'Jordi', familyName: 'Vilaplana').save(failOnError: true)
        }
    }
    def destroy = {
    }
}
