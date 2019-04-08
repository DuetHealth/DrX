import Foundation
import RxSwift

/// The set of all possible events that may occur during the lifecycle of an observable sequence.
public struct SequenceEvent: OptionSet {
    public typealias RawValue = Int

    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    /// Before subscribing to the observable sequence.
    public static let subscribe = SequenceEvent(rawValue: 1)

    /// After subscribing to the observable sequence.
    public static let subscribed = SequenceEvent(rawValue: 2)

    /// An element in the observable sequence.
    public static let next = SequenceEvent(rawValue: 4)

    /// Graceful termination of the observable sequence.
    public static let completed = SequenceEvent(rawValue: 8)

    /// Errored termination of the sequence.
    public static let error = SequenceEvent(rawValue: 16)

    /// After subscription to the sequence has been disposed for any reason.
    public static let dispose = SequenceEvent(rawValue: 32)

    /// All events.
    public static var all: SequenceEvent {
        return [.subscribe, .subscribed, .next, .completed, .error, .dispose]
    }

}

public extension DrXNamespace {

    /// Invokes an action for the specified events in the observable sequence. The action is
    /// independent from the elements of the sequence.
    func `do`(on events: SequenceEvent = SequenceEvent.all, _ behavior: @escaping () -> ()) -> Observable<Element> {
        return decoratedSequence.do(
            onNext: events.contains(.next) ? { _ in behavior() } : nil,
            onError: events.contains(.error) ? { _ in behavior() } : nil,
            onCompleted: events.contains(.completed) ? behavior : nil,
            onSubscribe: events.contains(.subscribe) ? behavior : nil,
            onSubscribed: events.contains(.subscribed) ? behavior : nil,
            onDispose: events.contains(.dispose) ? behavior : nil)
    }

}
