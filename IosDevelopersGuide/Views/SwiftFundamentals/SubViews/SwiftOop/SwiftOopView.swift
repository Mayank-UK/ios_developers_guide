//
//  SwiftOop.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftOopView: View {
    func classes() -> some View {
        return CustomSection(
            snippetTitle: "Classes and objects",
            snippetDescription: """
            In Swift, a class serves as a blueprint for creating objects.
            An object is an instance of a class, encapsulating both data (properties) and behavior (methods).
            Think of a class as a template and an object as a specific instance created from that template.
            
            Properties represent the data associated with a class.
            Methods are functions associated with a class.
            """,
            snippetCode: """
            class Person {
                var name: String
                init(name: String) {
                    self.name = name
                }
            }
            
            let person1 = Person(name: "Alice")
            let person2 = Person(name: "Bob")
            """
        )
    }
    
    func inheritance() -> some View {
        return CustomSection(
            snippetTitle: "Inheritance",
            snippetDescription: """
            Inheritance allows a class to inherit properties and methods from another class (superclass).
            
            Subclasses can override methods from their superclass. Use the override keyword.
            Access Control:
            - Swift provides access control to restrict the visibility of properties and methods.
            - Use public, internal, private, or fileprivate.
            """,
            snippetCode: """
            class Person {
                var name: String
                init(name: String) {
                    self.name = name
                }
            }
            
            class Student: Person {
                private var studentID: Int
                init(name: String, studentID: Int) {
                    self.studentID = studentID
                    super.init(name: name)
                }
            }
            """
        )
    }
    
    
    func polymorphism() -> some View {
        return CustomSection(
            snippetTitle: "Polymorphism",
            snippetDescription: """
            Polymorphism allows objects of different classes to be treated uniformly.
            Achieved through inheritance and method overriding.
            """,
            snippetCode: """
            let animal: Animal = Dog()
            animal.makeSound() // Calls Dog's overridden method
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "OOP",
            content: {
                classes()
                inheritance()
                polymorphism()
            }
        )

    }
}

#Preview {
    SwiftOopView()
}
