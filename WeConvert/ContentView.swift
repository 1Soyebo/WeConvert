//
//  ContentView.swift
//  WeConvert
//
//  Created by Ibukunoluwa Soyebo on 11/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    let conversionValues = ["M", "KM", "Yr", "Ft", "Miles"]
    
    @State private var value_input = ""
    @State private var input_Unit = 0
    @State private var output_Unit = 0
    
    var computedOutPut: String{
        return ""
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Input Value to Convert", text: $value_input)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("From")){
                    Picker("Select", selection: $input_Unit){
                        ForEach(0..<conversionValues.count){
                            Text(conversionValues[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("TO")){
                    Picker("Select", selection: $output_Unit){
                        ForEach(0..<conversionValues.count){
                            Text(conversionValues[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output")){
                    Text(computedOutPut)
                }
            }
            
            .navigationTitle("WeConvert")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
