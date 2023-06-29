require_relative "file_loader"

lista_autos = load_file("AutosTEST1")
#imprimirLista(lista_autos)

menu = ["Mostrar Autos","Buscar"]
menu.push("Salir")


while true
    puts "\n--------------------------"

    menu.each_with_index do |m, index|
        print index+1,". ", m, "\n"
    end

    selec = gets.chomp.to_i
    selec -= 1
    
    puts menu[selec]

    if (selec == menu.length-1)
        break
    end

    if (selec == 0)
        system("cls")
        imprimirLista(lista_autos)
    end

    if (selec == 1)
        puts("Seleccione llave de busqueda\nMarca / Modelo / Patente / Año / Color")
        llave = gets.chomp
        puts("Seleccione el valor a buscar")
        param = gets.chomp
        lista_f = buscar(lista_autos,param,llave)
        system("cls")
        imprimirLista(lista_f)
    end
end