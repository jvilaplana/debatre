import com.jordiv.debatre.Role
import com.jordiv.debatre.User
import com.jordiv.debatre.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

        def adminUser = new User(username: 'anborn@gmail.com', password: 'jtest', fullName: "Jordi Vilaplana", authorities: [adminRole]).save(flush: true)
        def mortalUser = new User(username: 'gatasuna@gmail.com', password: 'jtest', fullName: "Jordi Vilaplana", authorities: [userRole]).save(flush: true)

        //assert User.count() == 1
        //assert Role.count() == 2
        //assert UserRole.count() == 1
    }
    def destroy = {
    }
}
