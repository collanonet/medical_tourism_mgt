# medical_tourism_mgt

# create module


## Get Started

### 1. Installation

1. Flutter
   `https://docs.flutter.dev/get-started/install`
2. Melos
   `https://melos.invertase.dev/~melos-latest/getting-started`
3. Run `melos setup`

## Debuging

`fvm flutter run -d chrome --web-port 5555`

## Deployment Process

```mermaid
flowchart TD
   A(App) --> MAPP(Lib)
   MAPP(Lib) --> FAG(:feature_agent)
   MAPP(Lib) --> FA(:feature_auth)
   MAPP(Lib) --> FH(:feature_hispital)
   MAPP(Lib) --> FI(:feature_invoice)
   MAPP(Lib) --> FMV(:feature_medical_visa)
   MAPP(Lib) --> FP(:feature_patient)
   MAPP(Lib) --> FPC(:feature_process_chart)
   MAPP(Lib) --> FQ(:feature_quotation)
   MAPP(Lib) --> FR(:feature_report)
   MAPP(Lib) --> FS(:feature_sale)
   MAPP(Lib) --> FWA(:feature_web_appointment)
   MAPP(Lib) --> FC(:feature_chats)

   FAG --> DFAG(:data_agent)
   FA--> DFA(:data_auth)
   FH --> DFH(:data_hispital)
   FI --> DFI(:data_invoice)
   FMV --> DFMV(:data_medical_visa)
   FP --> DFP(:data_patient)
   FPC --> DFPC(:data_process_chart)
   FQ --> DFQ(:data_quotation)
   FR --> DFR(:data_report)
   FS --> DFS(:data_sale)
   FWA --> DFWA(:data_web_appointment)
   FC --> DFC(:data_chats)

```

```mermaid
flowchart TD
   MAPP(App Core) --> FAG(:base_view)
   MAPP(App Core) --> FA(:core_l10n)
   MAPP(App Core) --> FH(:core_network)
   MAPP(App Core) --> FI(:core_storage)
   MAPP(App Core) --> FMV(:core_ui)
   MAPP(App Core) --> FP(:core_utils)

```

Base View: for menu layout
Core l10n: for translate
Core Network: for api server and model data request/response
Core Storage: for store some cache data (if need)
Core UI: for create widget able to use every feature modules
Core Utils: for create function able to use every feature modules


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

### Android

### iOS

## Compatibility

## Scripts

Check out `melos.yaml` all available scripts.
