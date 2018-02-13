
import Foundation
import RxSwift
import Nimble
import Quick

@testable import DrX

class ZipSpec: QuickSpec {
    
    override func spec() {

        describe("zip(with:)") {

            it("Produces tuples of elements and a constant value") {
                var array = [(String, String)]()
                Observable.from(["See", "Hear", "Speak"]).drx.zip(with: "no evil")
                    .subscribe(onNext: { tuple in
                        array.append(tuple)
                    })
                expect(array).toEventually(Predicate { expression in
                    let expected = [("See", "no evil"), ("Hear", "no evil"), ("Speak", "no evil")]
                    let message = ExpectationMessage.expectedActualValueTo("equal <\(expected)>")
                    guard let actual = try! expression.evaluate() else {
                        return PredicateResult(status: .fail, message: message.appended(message: "(call threw)"))
                    }
                    let nonMatch = zip(actual, expected).first { (actualElement, expectedElement) in
                        return actualElement.0 != expectedElement.0 || actualElement.1 != expectedElement.1
                    }
                    if let _ = nonMatch { return PredicateResult(status: .fail, message: message) }
                    return PredicateResult(status: .matches, message: message)
                })
            }

        }
    }
}
