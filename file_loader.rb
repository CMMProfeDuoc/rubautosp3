def load_file (file_name="autos1",extension=".csv")
    lista = Array.new
    file = File.foreach(file_name+extension) do |line|
        line = line.chomp
        data_arr = line.split(";")
        auto_aux = {}
            auto_aux["marca"] = data_arr[0]
            auto_aux["modelo"] = data_arr[1]
            auto_aux["año"] = data_arr[2]
            auto_aux["patente"] = data_arr[3]
            auto_aux["color"] = data_arr[4]

        lista.push(auto_aux)
    end
    return lista
end

def imprimirAuto (auto)
    auto.keys.each do |k|
        print auto[k], " "
    end
end

def imprimirLista (lista)
    lista.each_with_index do |auto, i|
        print i+1, ". "
        imprimirAuto(auto)
        puts
    end
end

def is_numeric? (string)
    true if Float(string) rescue false
end

def selec (lista, sel)
    if (is_numeric?(sel))
        if sel < lista.length and sel >= 0
            return lista[sel]
        end
    end
    return nil
end

def buscar (lista, filtro="", llave)
    lista_filtro = Array.new
    lista.each do |auto|
        busqueda = auto[llave].to_s
        busqueda = busqueda.upcase
        if (busqueda.include?(filtro.upcase))
            lista_filtro.push(auto)
        end
    end
    return lista_filtro
end

def add_propietario (auto, propietario)
    auto["propietario"] = propietario
end

def getNumSelec
    while true
        sel = gets.chomp
        is_numeric?(sel) ? break : print("Opcion no valida\n")
    end
    sel.to_i
    return sel
end
