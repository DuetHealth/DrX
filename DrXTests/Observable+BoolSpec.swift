
import Foundation
import RxSwift
import Nimble
import Quick

@testable import DrX

class Observable_BoolSpec: QuickSpec {

    override func spec() {

        describe("The Boolean operators") {

            context("whenTrue") {

                it("Eventually emits upon true value") {
                    var outlet = false
                    let observable = Observable.just(true).drx.whenTrue()
                    observable.subscribe(onNext: { value in
                        outlet = value
                    })
                    expect(outlet).toEventually(beTrue())
                }

                it("Never emits upon false value") {
                    var outlet = true
                    let observable = Observable.just(false).drx.whenTrue()
                    observable.subscribe(onNext: { value in
                        outlet = value
                    })
                    expect(outlet).toNotEventually(beFalse())
                }

            }
            
            context("whenFalse") {

                it("Eventually emits upon false value") {
                    var outlet = true
                    let observable = Observable.just(false).drx.whenFalse()
                    observable.subscribe(onNext: { value in
                        outlet = value
                    })
                    expect(outlet).toEventually(beFalse())
                }

                it("Never emits upon true value") {
                    var outlet = true
                    let observable = Observable.just(true).drx.whenFalse()
                    observable.subscribe(onNext: { value in
                        outlet = value
                    })
                    expect(outlet).toNotEventually(beFalse())
                }

            }

            context("whenTrue(send:)") {

                it("Eventually emits the constant value upon true") {
                    var outlet = ""
                    let observable = Observable.just(true).drx.whenTrue(send: "Yeehaw")
                    observable.subscribe(onNext: { value in
                        outlet = value
                    })
                    expect(outlet).toEventually(equal("Yeehaw"))
                }

                it("Never emits upon true value") {
                    var outlet = ""
                    let observable = Observable.just(false).drx.whenTrue(send: "Yeehaw")
                    observable.subscribe(onNext: { value in
                        outlet = value
                    })
                    expect(outlet).toEventuallyNot(equal("Yeehaw"))
                }

            }

            context("whenFalse(send:)") {

                it("Eventually emits the constant value upon false") {
                    var outlet = ""
                    let observable = Observable.just(false).drx.whenFalse(send: "Yeehaw")
                    observable.subscribe(onNext: { value in
                        outlet = value
                    })
                    expect(outlet).toEventually(equal("Yeehaw"))
                }

                it("Never emits upon true value") {
                    var outlet = ""
                    let observable = Observable.just(true).drx.whenFalse(send: "Yeehaw")
                    observable.subscribe(onNext: { value in
                        outlet = value
                    })
                    expect(outlet).toEventuallyNot(equal("Yeehaw"))
                }

            }

            context("ifTrue") {

                it("Emits the satisfied value on true") {
                    var outlet = ""
                    let observable = Observable.just(true).drx.ifTrue(then: "Yeehaw", else: "Oh, no!")
                    observable.subscribe(onNext: { value in
                        outlet = value
                    })
                    expect(outlet).toEventually(equal("Yeehaw"))
                }

                it("Emits the unsatisfied value on false") {
                    var outlet = ""
                    let observable = Observable.just(false).drx.ifTrue(then: "Yeehaw", else: "Oh, no!")
                    observable.subscribe(onNext: { value in
                        outlet = value
                    })
                    expect(outlet).toEventually(equal("Oh, no!"))
                }

            }

            context("ifFalse") {

                it("Emits the satisfied value on false") {
                    var outlet = ""
                    let observable = Observable.just(false).drx.ifFalse(then: "Yeehaw", else: "Oh, no!")
                    observable.subscribe(onNext: { value in
                        outlet = value
                    })
                    expect(outlet).toEventually(equal("Yeehaw"))
                }

                it("Emits the unsatisfied value on true") {
                    var outlet = ""
                    let observable = Observable.just(true).drx.ifFalse(then: "Yeehaw", else: "Oh, no!")
                    observable.subscribe(onNext: { value in
                        outlet = value
                    })
                    expect(outlet).toEventually(equal("Oh, no!"))
                }

            }

        }
    }
}

