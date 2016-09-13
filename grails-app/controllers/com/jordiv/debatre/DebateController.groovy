package com.jordiv.debatre

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
class DebateController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Transactional
    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Debate.list(params), model:[debateCount: Debate.count()]
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def show(Debate debate) {
        def comments = debate.comments
        respond debate, model: [comments: comments]
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def create() {
        respond new Debate(params)
    }

    @Transactional
    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def save(Debate debate) {
        if (debate == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (debate.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond debate.errors, view:'create'
            return
        }

        debate.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'debate.label', default: 'Debate'), debate.id])
                redirect debate
            }
            '*' { respond debate, [status: CREATED] }
        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def edit(Debate debate) {
        respond debate
    }

    @Transactional
    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def update(Debate debate) {
        if (debate == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (debate.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond debate.errors, view:'edit'
            return
        }

        debate.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'debate.label', default: 'Debate'), debate.id])
                redirect debate
            }
            '*'{ respond debate, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def delete(Debate debate) {

        if (debate == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        debate.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'debate.label', default: 'Debate'), debate.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'debate.label', default: 'Debate'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
