# Travelly Flutter Screens

Estrutura em arquivos separados para as telas:
- Splash
- Login
- Cadastro

## Estrutura

- `lib/main.dart`
- `lib/theme/app_theme.dart`
- `lib/widgets/app_text_field.dart`
- `lib/screens/splash_screen.dart`
- `lib/screens/login_screen.dart`
- `lib/screens/register_screen.dart`
- `pubspec_fonts_snippet.yaml`

## Fontes

Este pacote já vem preparado para usar as famílias:
- `BebasNeue`
- `Oswald`

Tu só precisa colocar manualmente os arquivos `.ttf` em `assets/fonts/` e copiar o conteúdo de `pubspec_fonts_snippet.yaml` para o teu `pubspec.yaml`.

## Observações

- O Figma MCP bateu no limite do plano ao tentar buscar contexto extra. Então a base foi montada a partir da leitura já disponível das telas e da estrutura que eu consegui extrair antes do limite.
- A organização já está pronta para plugar validação, navegação real, integração com backend e responsividade mais refinada.
