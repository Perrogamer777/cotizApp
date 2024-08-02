import SwiftUI

struct ContentView: View {
    @State private var companyName = "Mantenciones industriales Luis Eduardo Olavarria Cardenas E.I.R.L."
    @State private var requestDate = Date()
    @State private var contactName = "Luis Olavarría"
    @State private var phoneNumber = "9 74215363"
    @State private var email = "locservicios@gmail.com"
    @State private var quoteNumber = ""
    
    @State private var laborEntries: [LaborEntry] = []
    @State private var materialEntries: [MaterialEntry] = []
    @State private var transportValue = ""
    @State private var collationValue = ""
    
    @State private var selection: String? = "Nueva Cotización"
    
    struct LaborEntry: Identifiable {
        let id = UUID()
        var quantity: String
        var description: String
        var hours: String
        var schedule: String
        var total: String
    }
    
    struct MaterialEntry: Identifiable {
        let id = UUID()
        var quantity: String
        var description: String
        var unitValue: String
        var total: String
    }
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: NewQuoteView(), tag: "Nueva Cotización", selection: $selection) {
                    Label("Nueva Cotización", systemImage: "plus.circle")
                }
                NavigationLink(destination: RecentQuotesView(), tag: "Cotizaciones Recientes", selection: $selection) {
                    Label("Cotizaciones Recientes", systemImage: "clock")
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Cotizaciones")
            
            NewQuoteView()
        }
    }
}

struct NewQuoteView: View {
    @State private var companyName = ""
    @State private var requestDate = Date()
    @State private var contactName = ""
    @State private var phoneNumber = ""
    @State private var email = ""
    @State private var quoteNumber = ""
    
    @State private var laborEntries: [ContentView.LaborEntry] = []
    @State private var materialEntries: [ContentView.MaterialEntry] = []
    @State private var transportValue = ""
    @State private var collationValue = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Generar cotización").font(.title)
                Spacer()
                Text("Cot N: \(quoteNumber)")
            }
            .padding()
            
            Form {
                Section(header: Text("Información de la Empresa")) {
                    TextField("Empresa", text: $companyName)
                    TextField("Teléfono", text: $phoneNumber)
                    TextField("Contacto", text: $contactName)
                    DatePicker("Fecha", selection: $requestDate, displayedComponents: .date)
                }
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Servicio por:").font(.headline)
                        
                        VStack(alignment: .leading) {
                            Text("Mano de obra").font(.headline)
                            HStack {
                                Text("Cantidad")
                                Text("Descripción")
                                Text("H.H")
                                Text("Horario")
                                Text("Total")
                            }
                            .font(.subheadline)
                            
                            ForEach(laborEntries.indices, id: \.self) { index in
                                HStack {
                                    TextField("Cantidad", text: $laborEntries[index].quantity)
                                    TextField("Descripción", text: $laborEntries[index].description)
                                    TextField("H.H", text: $laborEntries[index].hours)
                                    TextField("Horario", text: $laborEntries[index].schedule)
                                    TextField("Total", text: $laborEntries[index].total)
                                }
                            }
                            
                            Button(action: {
                                laborEntries.append(ContentView.LaborEntry(quantity: "", description: "", hours: "", schedule: "", total: ""))
                            }) {
                                Text("Añadir Mano de Obra")
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Materiales").font(.headline)
                            HStack {
                                Text("Cantidad")
                                Text("Descripción")
                                Text("Valor unitario")
                                Text("Total")
                            }
                            .font(.subheadline)
                            
                            ForEach(materialEntries.indices, id: \.self) { index in
                                HStack {
                                    TextField("Cantidad", text: $materialEntries[index].quantity)
                                    TextField("Descripción", text: $materialEntries[index].description)
                                    TextField("Valor unitario", text: $materialEntries[index].unitValue)
                                    TextField("Total", text: $materialEntries[index].total)
                                }
                            }
                            
                            Button(action: {
                                materialEntries.append(ContentView.MaterialEntry(quantity: "", description: "", unitValue: "", total: ""))
                            }) {
                                Text("Añadir Material")
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Transporte").font(.headline)
                            TextField("Valor", text: $transportValue)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Colación").font(.headline)
                            TextField("Valor", text: $collationValue)
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    Text("Total: $ +IVA").font(.title)
                }
            }
            .padding()
        }
    }
}

struct RecentQuotesView: View {
    var body: some View {
        Text("Aquí se mostrarán las cotizaciones recientes.")
            .font(.title)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
