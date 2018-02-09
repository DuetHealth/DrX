
import Foundation
import RxSwift
import Nimble
import Quick

@testable import DrX

class DrXTests: QuickSpec {

    private class Foo { }
    private class Bar: Foo { }
    private class Baz { }

    override func spec() {



            

        describe("The covariant operator") {

            context("when applied to observable sequences of elements") {

                it("Casts down Bars to Foos") {
                    var foos = [Foo]()
                    Observable.from([Bar(), Bar(), Bar()])
                        .drX.covariant(ofType: Foo.self)
                        .subscribe(onNext: { foo in
                            foos.append(foo)
                        })
                    expect(foos.count).toEventually(equal(3))
                }

                it("Produces a fatal error when attempting to cast unrelated types") {
                    var foos = [Foo]()
                    let behavior = {
                        Observable.from([Baz(), Baz(), Baz()])
                            .drX.covariant(ofType: Foo.self)
                            .subscribe(onNext: { foo in
                                foos.append(foo)
                            })
                        return
                    }
                    expect(behavior()).toEventually(throwAssertion())
                }

            }

            context("when applied to observable sequences of sequences of elements") {

                it("Casts down Sequences of Bars to Sequences of Foos") {
                    var foos = [Foo]()
                    Observable.just([Bar(), Bar(), Bar()])
                        .drX.covarying(toType: Foo.self)
                        .subscribe(onNext: { array in
                            foos = array
                        })
                    expect(foos.count).toEventually(equal(3))
                }

                it("Produces a fatal error when attempting to cast unrelated sequence element types") {
                    let behavior = {
                        Observable.just([Baz(), Baz(), Baz()])
                            .drX.covarying(toType: Foo.self)
                            .subscribe(onNext: { array in
                                var _ = array
                            })
                        return
                    }
                    expect(behavior()).toEventually(throwAssertion())
                }

            }

        }

    }

}

