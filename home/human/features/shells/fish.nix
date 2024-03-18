{
  programs.fish = {
    enable = true;
    functions = {
      fish_greeting = /* fish */ ''
        clear
        figlet -f smslant $hostname
        echo ""
      ''
    };
  };

  programs.figlet = {
    enable = true;
  }
}
