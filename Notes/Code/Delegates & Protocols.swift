protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport? // Optional
    func assessSituation() {
        print("What's your issue?!")
    }
    func medicalEmergency() {
        delegate?.performCPR() // Optional Chaining
    }
}


struct Paramedic: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    func performCPR() {
        print("Bust out some chest compressions and hope for the best!")
    }
}

class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    func performCPR() {
        print("Bust out dem padels and zap away!")
    }
    func useNeckInstrument() {
        print("Listen to the sound resonating from the left side of the chest.")
    }
}


class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("They'll surly live cause I am a surgeon.")
    }
    func useElectricDrill() {
        print("Vrooooom!")
    }
}

let emily = EmergencyCallHandler()
let jack = Paramedic(handler: emily)
let angela = Surgeon

emily.assessSituation()
emily.medicalEmergency()