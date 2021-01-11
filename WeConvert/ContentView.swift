//
//  ContentView.swift
//  WeConvert
//
//  Created by Ibukunoluwa Soyebo on 11/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    let array_conversionValues = ["M", "KM", "Yd", "Ft", "Miles"]
    
    @State private var value_input = ""
    @State private var input_Unit = 0
    @State private var output_Unit = 0
    
    var computed_input_Value_millimeters: Double{
        let convertedValue = Double(value_input) ?? 0
        let selected_input_unit = array_conversionValues[input_Unit]
        
        switch selected_input_unit {
        case "M":
            return convertedValue * 1000
        case "KM":
            return convertedValue * 1000 * 1000
        case "Yd":
            return convertedValue * 914.4
        case "Ft":
            return convertedValue * 304.8
        case "Miles":
            return convertedValue * 1.609e+6
        default:
            return 0
        }
    }
    
    var computed_OutPut: Double{
        let selected_output_unit = array_conversionValues[output_Unit]
        
        switch selected_output_unit {
        case "M":
            return computed_input_Value_millimeters / 1000
        case "KM":
            return computed_input_Value_millimeters / (1000 * 1000)
        case "Yd":
            return computed_input_Value_millimeters / (914.4)
        case "Ft":
            return computed_input_Value_millimeters / (304.8)
        case "Miles":
            return computed_input_Value_millimeters / (1.609e+6)
        default:
            return 0
        }
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
                        ForEach(0..<array_conversionValues.count){
                            Text(array_conversionValues[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("TO")){
                    Picker("Select", selection: $output_Unit){
                        ForEach(0..<array_conversionValues.count){
                            Text(array_conversionValues[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output")){
                    Text("\(computed_OutPut, specifier: "%.2f")")
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
