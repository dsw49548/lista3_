function show_help() {
  echo "Dostepne opcje skryptu:"
  echo "- --date: Wyświetla dzisiejszą datę."
  echo "- --logs [liczba]: Tworzy automatycznie [liczba] plików logx.txt, zawierających nazwy, nazwy skryptu i datę."
  echo "- --help: Wyświetla pomoc."
}

function show_date() {
  echo "Dzisiejsza data: $(date)"
}

function create_logs() {
  local count=$1
  for ((i=1; i<=$count; i++))
  do
    filename="log$i.txt"
    echo "Nazwa pliku: $filename" > "$filename"
    echo "Nazwa skryptu: $0" >> "$filename"
    echo "Data utworzenia: $(date)" >> "$filename"
    echo "Plik $filename utworzony"
  done
}


case "$1" in
  --date)
    show_date
    ;;
  --logs)
    if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
      create_logs "$2"
    else
      create_logs 100
    fi
    ;;
  --help)
    show_help
    ;;
  *)
    echo "Nieznana opcja. Uzyj --help, aby zobaczyc dostpne opcje."
    ;;
esac
