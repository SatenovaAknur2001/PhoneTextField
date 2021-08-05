//
//  ValidateViewModel.swift
//  PhoneTextField
//
//  Created by Акнур on 02.08.2021.
//



import SwiftUI
import Combine

class ValidateViewModel: ObservableObject {
    
    typealias ValidatePublisher = AnyPublisher<Bool, Never>
    
    @Published var placeholderPhone = "_ _ _ _  _ _ _ _  _ _ _ _  _ _ _ _"
    @Published var placeholderPhoneNumber = "+7 (_ _ _) _ _ _  _ _  _ _"
    @Published var placeholderPhoneNumber2 = "Введите номер телефона"
    @Published var placeholderDocument = "Введите ИИН"
    @Published var placeholderPassword = "MM"
    @Published var yearplaceholder = "YYYY"
    @Published var CVPlaceholder = "CV"
    @Published var sizebeforePlaceholder = "    м²"
    @Published var sizeafterPlaceholder = "    м²"
    @Published var placeholderfilter =  "    Введите название фильтра"
    @Published var sectionTitlePhone = "    Номер карты"
    @Published var sectionTitleFilter = ""
    @Published var sectionTitleConfirmPassword = "Введите пароль ещё раз"
    @Published var sectionTitleBefore = "   До"
    @Published var sectionTitleAfter = "  От"
    @Published var sectionTitleDocument = "  ИИН"
    @Published var sectionTitlePhoneNumber = "  Номер телефона"
    @Published var before = ""
    @Published var after = ""
    @Published var phone = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var year = ""
    @Published var cv = ""
    @Published var filter = ""
    @Published var phoneNumber = ""
    @Published var document = ""

    @Published var phoneErrorMessage = ""
    @Published var passwordMessage = ""
    @Published var isValid = false
    @Published var isValidPhone = false
    @Published var isValidPasswords = false
    
    @Published var isError = false
    @Published var errorMessage = ""
    
    @Published var isRecoveryPassword = false
    
    @Published var validations: [Validation] = []
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    private var isPasswordEqualsPublisher: ValidatePublisher {
        Publishers.CombineLatest($password, $confirmPassword)
            .map { $0 == $1 }
            .eraseToAnyPublisher()
    }
    
    private var isPasswordBothCorrectPubliches: ValidatePublisher {
        Publishers.CombineLatest(isPasswordEqualsPublisher, passwordPublisher)
            .map { passwordEqual, passwordIsValid in
                passwordEqual && passwordIsValid.filter { validation in
                    return ValidationState.failure == validation.state
                }.isEmpty
            }
            .eraseToAnyPublisher()
    }
    
    private var passwordPublisher: AnyPublisher<[Validation], Never> {
        $password
            .removeDuplicates()
            .map { password in
                
                var validations: [Validation] = []
                validations.append(Validation(string: password,
                                              id: 0,
                                              field: .password,
                                              validationType: .isNotEmpty))
                
                validations.append(Validation(string: password,
                                              id: 1,
                                              field: .password,
                                              validationType: .minCharacters(min: 8)))
                
                validations.append(Validation(string: password,
                                              id: 2,
                                              field: .password,
                                              validationType: .hasLowercasedLetters))
                
                validations.append(Validation(string: password,
                                              id: 3,
                                              field: .password,
                                              validationType: .hasUppercasedLetters))
                
                validations.append(Validation(string: password,
                                              id: 4,
                                              field: .password,
                                              validationType: .hasDigit))
                return validations
            }
            .eraseToAnyPublisher()
    }
    
    private var isPhoneValidPublisher: ValidatePublisher {
        $phone
            .removeDuplicates()
            .filter { ![" ", "-", "(", ")", "+"].contains($0) }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines).count >= 17 }
            .handleEvents(receiveOutput: { [weak self] in $0 ? (self?.phoneErrorMessage = "") : (self?.phoneErrorMessage = "User phone must at least have 11 characters")})
            .eraseToAnyPublisher()
    }
    
    private var isPhonePasswordValidatePublisher: ValidatePublisher {
        Publishers.CombineLatest(isPhoneValidPublisher, passwordPublisher)
            .map { phoneIsValid, passwordIsValid in
                phoneIsValid && passwordIsValid.filter { validation in
                    return ValidationState.failure == validation.state
                }.isEmpty
            }
            .eraseToAnyPublisher()
    }
    
    init() {
        
        passwordPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.validations, on: self)
            .store(in: &cancellableSet)
        
        isPasswordBothCorrectPubliches
            .receive(on: RunLoop.main)
            .assign(to: \.isValidPasswords, on: self)
            .store(in: &cancellableSet)
        
        
        isPhonePasswordValidatePublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellableSet)
        
        isPhoneValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValidPhone, on: self)
            .store(in: &cancellableSet)
    }
    
    public func getPhoneNumber() -> String {
        return phone.filter { ![" ", "-", "(", ")", "+"].contains($0) }
    }
    
    public func checkOTPCode(_ inputCode: String, _ getCode: String) -> Bool {
        return inputCode.isEqual(getCode)
    }
}

struct Validation: Identifiable {
    var id: Int
    var field: TextFieldProperty
    var validationType: ValidationType
    var state: ValidationState
    
    init(string: String, id: Int, field: TextFieldProperty, validationType: ValidationType) {
        self.id = id
        self.field = field
        self.validationType = validationType
        self.state = validationType.fulfills(string: string) ? .success : .failure
    }
    
}

enum ValidationState {
    case success
    case failure
}

enum ValidationType {
    case isNotEmpty
    case minCharacters(min: Int)
    case hasLowercasedLetters
    case hasUppercasedLetters
    case hasDigit
    
    func fulfills(string: String) -> Bool {
        switch self {
        case .isNotEmpty:
            return !string.isEmpty
        case .minCharacters(min: let min):
            return string.count > min
        case .hasLowercasedLetters:
            return string.isPasswordHasLowerCharacter()
        case .hasUppercasedLetters:
            return string.hasUppercasedCharacters()
        case .hasDigit:
            return string.isPasswordHasDigit()
        }
    }
    
    func message(fieldName: String) -> String {
        switch self {
        case .isNotEmpty:
            return "\(fieldName) Не пустой"
        case .minCharacters(min: let min):
            return "\(fieldName) Более \(min) символов"
        case .hasLowercasedLetters:
            return "\(fieldName) Прописные буквы"
        case .hasUppercasedLetters:
            return "\(fieldName) Заглавные буквы"
        case .hasDigit:
            return "\(fieldName) Цифры"
        }
    }
}
