# π΅ μ€νλ§μΌ
REST APIμμ μ°λμ ν΅ν΄ κ°λ¨ν λ§μΌκΈ°λ₯μ μ¬μ©ν΄λ³Ό μ μλ μ±μλλ€.<br>
μλ²μ ν΅μ νμ¬ λ°μμ¨ λ§μΌνλ§€ λ¦¬μ€νΈλ₯Ό νλ©΄μ λ³΄μ¬μ€λλ€.<br>
μ¬μ©μ κΈ°νΈμ λ°λΌ List νμ λλ Grid νμμΌλ‘ μνλ¦¬μ€νΈλ₯Ό λ³Ό μ μκ³ , ν°μΉμ μμΈνλ©΄μ λ³Ό μ μμ΅λλ€.<br>
νλ§€μλ μνμ μ¬μ§κ³Ό λ΄μ©μ λ±λ‘νκ³ , μμ νκ±°λ μ­μ ν  μ μμ΅λλ€.<br>
</br>

## π λͺ©μ°¨
1. [ν μκ°](#-ν-μκ°)
2. [κΈ°λ₯ μκ°](#-κΈ°λ₯-μκ°)
3. [Class Diagram](#-class-diagram)
4. [ν΄λ κ΅¬μ‘°](#-ν΄λ-κ΅¬μ‘°)
5. [νλ‘μ νΈμμ κ²½ννκ³  λ°°μ΄ κ²](#-νλ‘μ νΈμμ-κ²½ννκ³ -λ°°μ΄-κ²)
6. [νμλΌμΈ](#-νμλΌμΈ)
7. [κ³ λ―Όν λΆλΆ](#-κ³ λ―Όν-λΆλΆ)
8. [νΈλ¬λΈ μν](#-νΈλ¬λΈ-μν)
9. [μ°Έκ³  λ§ν¬](#-μ°Έκ³ -λ§ν¬)

</br>

## π± ν μκ°
 |[mene](https://github.com/JaeKimdev)|[μ¨λμΏ ν€](https://github.com/sunny-maeng)|
 |:---:|:---:|
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://avatars.githubusercontent.com/u/84453688?v=4">| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://avatars.githubusercontent.com/u/107384230?v=4">|

</br>

## π  κΈ°λ₯ μκ°
| **Listνμ μ νλ¦¬μ€νΈ νλ©΄** | **Gridνμ μ νλ¦¬μ€νΈ νλ©΄** |
| :-------------------------------------------: | :-------------------------------------------: |
| <img src = "https://i.imgur.com/g2WZJz1.gif"> | <img src = "https://i.imgur.com/RHOnQWz.gif"> |
| **μν μμΈ νλ©΄** |**μν λ±λ‘ νλ©΄** |
| <img src = "https://i.imgur.com/CxwvDpf.gif"> | <img src = "https://i.imgur.com/AdXGliN.gif"> |
| **μν μμ  νλ©΄** |**μν μ­μ  νλ©΄** |
| <img src = "https://i.imgur.com/T6jxq0u.gif"> | <img src = "https://i.imgur.com/uSZxeQe.gif"> |
| **μν λ±λ‘ Alertμ²λ¦¬** | **μ΄λ―Έμ§ λ‘λ© μ²λ¦¬** |
| <img src = "https://i.imgur.com/i06NzIw.gif"> | <img src = "https://i.imgur.com/oZEC1bx.gif"> |
</br>

## π Class Diagram
| Model |
| :-------------------------------------------: |
| <img src = "https://i.imgur.com/nNC3wcO.jpg"> |

| ViewController |
| :-------------------------------------------: |
| <img src = "https://i.imgur.com/xohPmtb.jpg"> |
</br>

## π ν΄λ κ΅¬μ‘°
```
.
OpenMarket
βββ OpenMarket
βΒ Β  βββ Model
βΒ Β  βΒ Β  βββ DTO
βΒ Β  βΒ Β  βΒ Β  βββ Currency
βΒ Β  βΒ Β  βΒ Β  βββ Market
βΒ Β  βΒ Β  βΒ Β  βββ Page
βΒ Β  βΒ Β  βΒ Β  βββ Product
βΒ Β  βΒ Β  βββ URLSession
βΒ Β  βΒ Β  β   βββ MarketURLSessionProvider
βΒ Β  βΒ Β  β   βββ NetworkError
βΒ Β  βΒ Β  β   βββ Request
βΒ Β  βΒ Β  β   βββ Decodable+Extension
βΒ Β  βΒ Β  β   βββ URLComponents+Extension
βΒ Β  βΒ Β  βΒ Β  βββ MockURLSession
βΒ Β  βΒ Β  βΒ Β  βΒ Β  βββ MockHTTPURLResponse
βΒ Β  βΒ Β  βΒ Β  βΒ Β  βββ MockURLSession
βΒ Β  βΒ Β  βΒ Β  βΒ Β  βββ MockURLSessionDataTask
βΒ Β  βΒ Β  βΒ Β  βΒ Β  βββ SampleData
βΒ Β  βΒ Β  βΒ Β  βΒ Β  βββ URLSessionProtocol
βΒ Β  βΒ Β  βββ Extension
βΒ Β  βΒ Β  βΒ Β  βββ DateFormatter+Extension
βΒ Β  βΒ Β  βββ ImageCache
βΒ Β  βΒ Β   Β Β  βββ ImageCacheProvider
βΒ Β  βββ View
βΒ Β  βΒ Β  βββ Base.lproj
βΒ Β  βΒ Β  βΒ Β  βββ LaunchScreen.storyboard
βΒ Β  βΒ Β  βββ MainView
βΒ Β  βΒ Β  βΒ Β  βββ Main.storyboard
βΒ Β  βΒ Β  βΒ Β  βββ MarketGridCell
βΒ Β  βΒ Β  βΒ Β  βββ MarketListCell
βΒ Β  βΒ Β  βββ DetailView
βΒ Β  βΒ Β  βΒ Β  βββ DetailImageCell
βΒ Β  βΒ Β  βΒ Β  βββ DetailView
βΒ Β  βΒ Β  βββ RegisterationView
βΒ Β  βΒ Β  β    βββ EditRegistrationView
βΒ Β  βΒ Β  β    βββ RegisterImageCell
βΒ Β  βΒ Β  β    βββ RegistrationView
βΒ Β  βΒ Β  βββ Extension
βΒ Β  βΒ Β  βΒ Β  βββ UIImage+Extension
βΒ Β  βΒ Β  βββ Custom
βΒ Β  βΒ Β   Β Β  βββ CustomAlert
βΒ Β  βΒ Β   Β Β  βββ CustomLabel
βΒ Β  βΒ Β   Β Β  βββ CustomStackView
βΒ Β  βΒ Β   Β Β  βββ CustomTextField
βΒ Β  βββ ViewController
βΒ Β      βββ MainViewController
βΒ Β      βΒ Β  βββ MainViewController
βΒ Β      βΒ Β  βββ MarketGridViewController
βΒ Β      βΒ Β  βββ MarketListViewController
βΒ Β      βββ DetailViewController
βΒ Β      βΒ Β  βββ DetailViewController
βΒ Β      βββ RegisterationViewController
βΒ Β      β   βββ RegistrationViewControllerProtocol
βΒ Β      β   βββ EditRegistrationViewController
βΒ Β      β   βββ NewRegistrationViewController
βΒ Β      βββ Extension
βΒ Β       Β Β  βββ NSMutableAttributedString+Extension
βΒ Β       Β Β  βββ String+Extension
βββ UnitTest
    βββ DecodeTests
    βΒ Β  βββ DecodeTests
    βββ MockURLSessionTests
        βββ MockURLSessionTests
```

</br>

## β νλ‘μ νΈμμ κ²½ννκ³  λ°°μ΄ κ²
- **JSONData νμ±**
     - [X] νμ±ν JSON λ°μ΄ν°μ λ§€νν  λͺ¨λΈ μ€κ³
     - [X] `keyDecodingStrategy`μ μ¬μ©ν SnakeCaseλ₯Ό CamelCaseλ‘ λ³ννλ λμ½λ© κ΅¬ν </br></br>
- **URL Sessionμ νμ©ν μλ²μμ ν΅μ **
     - [X] `URLComponents`λ₯Ό μ΄μ©ν΄ URLμ Pathμ QueryItemμ λ°μ url μ£Όμ μμ±
     - [X] `URLSession`κ³Ό κ΄λ ¨ νμλ€μ μ¬μ©ν΄ APIμμ± λ° μλ²μμ λ°μ΄ν°λ₯Ό λ°μμ€λ λ‘μ§ κ΅¬ν
     - [X] λ°μμ€λ λ°μ΄ν°μ HTTPURLResponse, mimeType, errorλ₯Ό μ²΄ν¬νλ©΄μ `dataTask`μμ±νλ λ‘μ§ κ΅¬ν
     - [X] multipart/form-dataμ κ΅¬μ‘° νμ
     - [X] URLSessionμ νμ©ν multipart/form-data μμ²­ μ μ‘ </br></br>
- **Unit Testλ₯Ό ν΅ν μ€κ³ κ²μ¦**
     - [X] μλ²μμ λ°μμ€λ λ°μ΄ν°μ κ°μ νμμ νμ€νΈμ© Asset dataλ₯Ό μ΄μ©ν΄ `DTO`μ μ»€μ€νν `Decoding` λ©μλμ μ μλμμ `UnitTest` μ§ν
     - [X] λ€νΈμν¬ μνμ λ¬΄κ΄νκ² μλ²μ ν΅μ νλ λ‘μ§μ νμ€νΈν  μ μλλ‘ `Mock`μ μ΄μ©ν `UnitTest` μ§ν</br></br>
- **Collection View / Modern Collection View νμ©**
    - [X] Modern Collection Viewλ₯Ό μ΄μ©ν ListView μ΄ν΄μ 
    - [X] Collection View / Modern Collection View νμ©
    - [X] DifferaleData μ μ©
    - [X] μμ±κ΅¬νμ Configurationκ΄λ ¨ νμλ€ μ μ© 
    - [X] UICollectionView λ₯Ό ν΅ν μ’μ° μ€ν¬λ‘€ κΈ°λ₯ κ΅¬ν </br></br>
- **μ¬μ©μ μΉνμ μΈ UI/UX κ΅¬ν**
    - [X] μ μ ν μλ ₯ μ»΄ν¬λνΈ μ¬μ©, μλ§μ ν€λ³΄λ νμ μ§μ 

</br>

## β° νμλΌμΈ

| π Step 1|  |
| :--------: | -------- |
| 1 | DTOκ΅¬ν - JSON λ°μ΄ν°μ λ§€νν  `Market`, `Page` νμ κ΅¬ν    |
| 2 | `URLSession`μ μ¬μ©ν μλ²μμ ν΅μ  λ‘μ§ κ΅¬ν | 
| 3 | `Mock`μΌλ‘ μλ² ν΅μ  λ‘μ§μ λ€νΈμν¬ μνμ λ¬΄κ΄νκ² unitTes μ§ν | 
<details>
<summary>[Details - Step1 νμλ³ κΈ°λ₯ μ€λͺ] </summary>

#### 1οΈβ£ DTO - `Market`,`Page`,`Product` κ΅¬μ‘°μ²΄, `Currency` μ΄κ±°ν 
- μλ²μμ μ κ³΅λλ JSONνμΌκ³Ό λ§€ννλ νμμλλ€.

#### 2οΈβ£ `MarketURLSessionProvider` ν΄λμ€
- μλ²μ ν΅μ νλ κΈ°λ₯μ ν©λλ€.
- `requestDataTask(of:, completionHandler:)`λ©μλ
    - `HTTPURLResponse`, `error`λ₯Ό νμΈνκ³  μλ²μμ λ°μ΄ν°λ₯Ό λ°μμ΅λλ€
    
#### 3οΈβ£ `Request` μ΄κ±°ν
- [HealthChekcer], [μν λ¦¬μ€νΈ μ‘°ν], [μν μμΈ μ‘°ν], [μν λ±λ‘], [μν μ λ³΄ μμ ], [μν μ­μ  Uri μ‘°ν], [μν μ­μ ]λ₯Ό caseλ‘ κ°κ³ μκ³ , urlλ³μλ‘ κ° caseλ§λ€μ URLμ£Όμλ₯Ό λ¦¬ν΄ν©λλ€.

#### 4οΈβ£ `NetworkError` μ΄κ±°ν
- μλ²μμ ν΅μ  μ€ λ°μκ°λ₯ν Errorλ₯Ό caseλ‘ κ°κ³ μμ΅λλ€.

#### 5οΈβ£ `URLComponents` extension
- `marketUrl(path:, queryItems:)` λ©μλ
    - pathμ queryItemsλ₯Ό λ°°μ΄λ‘ λ°μ Marketμ baseUrlμ λ°νμΌλ‘ url μ£Όμλ₯Ό μμ± ν λ¦¬ν΄ν©λλ€.

#### 6οΈβ£ `JSONDecoder` Extension
- `decodeFromSnakeCase(type:, from:)`λ©μλ
    - JSONνμμ λ°μ΄ν°λ₯Ό`keyDecodingStrategy`λ‘ `.convertFromSnakeCase`μ `.formatted(DateFormatter.dateFormatter)` λ₯Ό μ μ©ν΄ decodingν©λλ€.
    
#### 7οΈβ£ MockURLSession
- `URLSessionProtocol`, `MockURLSession` ν΄λμ€, `MockURLSessionDataTask`ν΄λμ€ , `SampleData` μ΄κ±°ν
    - λ€νΈμν¬ μνμ λ¬΄κ΄νκ² URLSessionμλμ νμΈνλ λ¨μ νμ€νΈ(Unit Test)μ μ¬μ©νλ νμ μλλ€.

#### 8οΈβ£ Unit Test - `DecodeTests` ν΄λμ€, `MockURLSessionTests` ν΄λμ€
- `DecodeTests` ν΄λμ€
    - μ κ³΅λ JSON λ°μ΄ν°λ₯Ό `Market` νμμΌλ‘ Parsing ν  μ μλμ§μ λν λ¨μ νμ€νΈ(Unit Test)μλλ€.
- `MockURLSessionTests` ν΄λμ€
    - `MockURLSession`κ³Ό `SampleData`λ₯Ό μ΄μ©ν΄ λ€νΈμν¬ μνμ λ¬΄κ΄νκ² URLSessionμλμ΄ μ μμ μΈμ§ νμΈνλ λ¨μ νμ€νΈ(Unit Test) μλλ€.
</details>
<br>

| π Step 2|                                                |
| :--------: | -------------------------------------------- |
| 1 | View κ΅¬ν - `Modern CollectionView`λ₯Ό νμ©ν΄ `ListCollectionView`κ΅¬ν  |
| 2 | View κ΅¬ν - `Modern CollectionView`λ₯Ό νμ©ν΄ 2μ΄ Nνμ `CollectionView`κ΅¬ν  | 
| 3 | μ΄λ―Έμ§ λ€μ΄λ‘λ λΉλκΈ° μ²λ¦¬ & μ΄λ―Έμ§ λ€μ΄λ‘λ μΊμ±μμ κ΅¬ν | 
<details>
<summary>[Details - Step2 νμλ³ κΈ°λ₯ μ€λͺ] </summary>

#### 1οΈβ£ `ImageCacheProvider` ν΄λμ€
- μ΄λ―Έμ§ μΊμ±μ μν΄ `NSCache`λ₯Ό μ±κΈν€μΌλ‘ κ΅¬ννμ΅λλ€.
#### 2οΈβ£ `MainViewController` ν΄λμ€
- μ€ν λ¦¬λ³΄λλ‘ κ΅¬νν MainViewλ₯Ό μ»¨νΈλ‘€ν©λλ€.
- Segmentλ‘ μ ν λ¦¬μ€νΈλ₯Ό λ³΄μ¬μ£Όλ λ°©μμ list λλ gridλ‘ λ³΄μ¬μ€λλ€.
- `setUpSegmentControl()`λ©μλ
    - segmentμ λ°°κ²½μκ³Ό κΈμμμ κΎΈλ©°μ€λλ€
- `changeView(_:)`
    - segment indexλ₯Ό μ΄μ©ν΄ λ³΄μ¬μ£Όκ³ μΆμ Viewμ λ³΄μ¬μ§μ§ μμμΌ ν  λ·°λ₯Ό `isHidden`μμ±μΌλ‘ μ»¨νΈλ‘€ν©λλ€.
#### 3οΈβ£ `MarketListViewController` ν΄λμ€
- μλ²μμ κ°μ Έμ¨ λ§μΌμ μνλͺ©λ‘μ List ννλ‘ λ³΄μ¬μ£Όλ Viewλ₯Ό μ»¨νΈλ‘€ν©λλ€.
- `fetchMarketData()` λ©μλ
    - μλ²μμ Marketλ°μ΄ν°λ₯Ό λ€μ΄λ°κ³  μ±κ³΅μ, ListViewλ₯Ό νλ©΄μ λ³΄μ¬μ€λλ€.
- `createListLayout()` λ©μλ
    - Listννμ Layoutμ λ°νν©λλ€.
- `configureListView()` λ©μλ
    - `createListLayout()`λ‘ λ§λ€μ΄μ§ Listννμ λ μ΄μμμ μ΄μ©ν ListViewλ₯Ό superViewμ μ μ²΄ μ¬μ΄μ¦λ‘ μμμ€λλ€.
- `configureDataSource()`
    - DataSourceλ₯Ό νμ©ν΄ cellμ μ»¨νμΈ λ₯Ό κ΅¬μ±νκ³  λ¦¬μ€νΈ ννμ λ·°μ Cellμ λ±λ‘ λ° snapshotμ μ°μ΄λμ΅λλ€.
#### 4οΈβ£ `MarketListCell` ν΄λμ€
- ListViewμ λ΄κΈΈ Cellμ λ μ΄μμκ³Ό μ»¨νμΈ λ₯Ό κ΅¬μ±ν©λλ€
- `configureCell(page:, completionHandler:)` λ©μλ
    - μνμ΄λ―Έμ§, μνμ΄λ¦, κ°κ²©, μμ¬μλμ Cellμ μ»¨νμΈ λ‘ κ΅¬μ±ν©λλ€.
- `setupLayout()` λ©μλ
    - Cellμ λ μ΄μμμ κ΅¬μ±ν©λλ€.
    - λ΄μ₯λμ΄ μλ `subtitleCell`μ labelκ³Ό imageViewκ° λ΄κΈ΄ StackViewλ₯Ό μΆκ°ν©λλ€.
    - μ»¨νμΈ λ·°μ μ€ν λ μ΄μμμ κ΅¬μ±ν©λλ€. 
#### 5οΈβ£ `MarketGridViewController` ν΄λμ€
- μλ²μμ κ°μ Έμ¨ λ§μΌμ μνλͺ©λ‘μ Grid ννλ‘ λ³΄μ¬μ£Όλ Viewλ₯Ό μ»¨νΈλ‘€ν©λλ€.
- `fetchMarketData()` λ©μλ
    - μλ²μμ Marketλ°μ΄ν°λ₯Ό λ€μ΄λ°κ³  μ±κ³΅μ, λ¦¬μ€νΈλ·°λ₯Ό νλ©΄μ λ³΄μ¬μ€λλ€.
- `setupGridLayout()` λ©μλ
    - 2μ΄ Nν ννμ Layoutμ λ°νν©λλ€.
- `setupGridFrameLayout()` λ©μλ
    - setupGridLayout() μΌλ‘ λ§λ€μ΄μ§ 2μ΄ Nν λ μ΄μμμ μ΄μ©ν GridViewλ₯Ό superViewμ μ μ²΄ μ¬μ΄μ¦λ‘ μμμ€λλ€.
- `configureDataSource()` λ©μλ
    - DataSourceλ₯Ό νμ©ν΄ cellμ μ»¨νμΈ λ₯Ό κ΅¬μ±νκ³  κ·Έλ¦¬λννμ λ·°μ Cellμ λ±λ‘ λ° snapshotμ μ°μ΄λμ΅λλ€.
#### 6οΈβ£ `MarketGridCell`
- `configureCell(page:, completionHandler:)` λ©μλ
    - μνμ΄λ―Έμ§, μνμ΄λ¦, κ°κ²©, μμ¬μλμ Cellμ μ»¨νμΈ λ‘ κ΅¬μ±ν©λλ€.
- `setupLayout()` λ©μλ
    - Cellμ λ μ΄μμμ κ΅¬μ±ν©λλ€.
    - ImageViewμ Label 3κ°λ₯Ό Vertical StackViewλ‘ λ¬Άκ³  Cellμ μ€ν λ μ΄μμμ κ΅¬μ±ν©λλ€.
#### 7οΈβ£ `NSMutableAttributedString` Extension
- `strikethrough(string:)` λ©μλ
    - Stringμ λΉ¨κ°μ·¨μμ μ μΆκ°νκ³  κΈμ¨ μμ λΉ¨κ°μμΌλ‘ λ³νν΄ NSMutableAttributedString νμμΌλ‘ λ°νν©λλ€
- `normal(string)` λ©μλ
    - Stringμ NSMutableAttributedString νμμ λ°νν©λλ€.
- `orangeColor(string:)` λ©μλ
    - String κΈμ¨ μμ μ€λ μ§μμΌλ‘ λ³νν΄ NSMutableAttributedString νμμΌλ‘ λ°νν©λλ€.
</details>
</br>

| π Step 3|                                                |
| :--------: | -------------------------------------------- |
| 1 | μν λ±λ‘/μμ  νλ©΄ κ΅¬ν |
| 2 | multipart/form-dataλ₯Ό μ΄μ©ν μλ²μ μνλ±λ‘ κΈ°λ₯ κ΅¬ν | 
| 3 | UIImagePickerControllerλ₯Ό νμ©ν μν μ¬μ§ Pick κΈ°λ₯ κ΅¬ν | 
| 4 | μ¬μ©μ μΉνμ μΈ UI/UXλ₯Ό μν μλ§μ ν€λ³΄λ νμ μ§μ  | 

<details>
<summary>[Details - Step3 νμλ³ κΈ°λ₯ μ€λͺ] </summary>

#### 1οΈβ£ `RegistrationView` ν΄λμ€, `RegisterImageCell` ν΄λμ€
- μνλ±λ‘/μμ  νλ©΄μ Viewλ₯Ό κ·Έλ¦½λλ€.
    - UICollectionView, UITextField, UISegment, UITextViewκ° StackView κ³μΈ΅μ λ΄κ²¨ μ€ν λ μ΄μμλ©λλ€.
    - μ μ²΄ νλ©΄μ΄ ScrollViewλ‘ μ΄λ£¨μ΄μ Έ ν€λ³΄λ νλ©΄λΈμΆ ν μ€ν¬λ‘€ μ, ν€λ³΄λκ° λ΄λ €κ°λλ€.
    - RegisterImageCellν΄λμ€λ imageCollectionViewμ Cellμ λ΄κΈΈ μ΄λ―Έμ§λ₯Ό μλ²μμ λ€μ΄λ°κ³ , λ μ΄μμν©λλ€.
#### 2οΈβ£ `CustomTextField` ν΄λμ€, `CustomStackView` ν΄λμ€
- Viewμ μμλ€μ΄ initλ  λ, μμ±μ΄ λΆμ¬λ©λλ€.
#### 3οΈβ£ `registrationViewController` νλ‘ν μ½
- νλ‘ν μ½ κΈ°λ³Έκ΅¬νμ ν΅ν΄ μνμμ /μνλ±λ‘ κ³Όμ μ κ³΅ν΅κΈ°λ₯ κ΅¬ν
- `createProductFromUserInput`λ©μλ
    - UserInputμΌλ‘ `Product`μΈμ€ν΄μ€λ₯Ό μμ±ν΄ λ¦¬ν΄ν©λλ€.
- κ·Έ μΈ `check...`λ©μλ
    - μνλͺ, ννκΈ°μ€, μνκ°κ²©, ν μΈκ°κ²©, μ¬κ³ , μμΈλ΄μ©μ UserInputμ΄ μ μ νμ§ νμΈνκ³  κΈ°μ€μ λ§μ§ μμΌλ©΄ μ¬μ©μμκ² `Alert`μΌλ‘ μμ ν  μμλλ‘ μλ΄ν©λλ€. 
#### 4οΈβ£ , `NewRegistrationViewController` ν΄λμ€, `EditRegistrationViewController` ν΄λμ€
- `RegistrationView`λ₯Ό μ»¨νΈλ‘€ν©λλ€. `NewRegistrationViewController`λ UserInputμ νμ©ν΄ μλ²μ μνμ λ±λ‘νκ³ , `EditRegistrationViewController`λ μλ²μ λ±λ‘λ μ λ³΄λ₯Ό μμ ν©λλ€.
- ImagePickerλ‘ κΈ°κΈ°μ μ¨λ²μ μλ μ¬μ§μ μνμ¬μ§μΌλ‘ λ±λ‘ν  μ μμ΅λλ€.
- μ μ κ° κ°μ μλ ₯ν  λ μ μ ν ν€λ³΄λλ₯Ό (μ«μν€λ³΄λ, λ¬Έμν€λ³΄λ) λ³΄μ¬μ€λλ€.
- ν€λ³΄λκ° λ€μ μ¬λΌμ§λλ‘ νλ 3κ°μ§ λ°©λ²μ μ κ³΅ν©λλ€ - λ·° μ€ν¬λ‘€ / ν€λ³΄λμ μΆκ°ν λ«κΈ°λ²νΌ ν΄λ¦­ / λΉνλ©΄ ν΄λ¦­
- ν€λ³΄λκ° μ€λ₯΄κ³  λ΄λ¦΄ λ, ν€λ³΄λκ° μ½νμΈ λ₯Ό κ°λ¦¬μ§ μλλ‘, `Notification`μ νμ©ν΄ λ·°μ `offset`μ΄ λ°λλλ€.
#### 5οΈβ£ `RequestManager` κ΅¬μ‘°μ²΄
- Requestλ₯Ό μμ±ν©λλ€.
- `generateRequest(url:, httpMethod:, headers:, bodyData:) -> URLRequest` λ©μλ
    - λ§€κ°λ³μλ‘ λ°μ μ λ³΄λ₯Ό μ΄μ©ν΄ URLRequestλ₯Ό λ¦¬ν΄ν©λλ€.
- `generateMultiPartFormDataRequest(textParameters:, imageKey:, images:) -> URLRequest?`
    - Bodyλ‘ Imageμ Textλ₯Ό λ΄λ `MultiPartFormData`νμμ URLRequestλ₯Ό λ¦¬ν΄ν©λλ€.
#### 6οΈβ£ `CustomAlert` ν΄λμ€
- `showAlert(message:, target:)` λ©μλ
    - λ§€κ°λ³μλ‘ λ°λ λ©μΈμ§λ₯Ό νλ©΄μ AlertμΌλ‘ λμλλ€.
</details>
</br>
    
| π Step 4|                                                |
| :--------: | -------------------------------------------- |
| 1 | μν μμΈνλ©΄ κ΅¬ν |
| 2 | μμ /μ­μ  λ©λ΄μ μ‘μ μνΈ κ΅¬ν  | 
| 3 | μλ²μ λ±λ‘λ μ νμ μμ (Fatch)λ° μ­μ (Delete)κΈ°λ₯ κ΅¬ν |

<details>
<summary>[Details - Step4 νμλ³ κΈ°λ₯ μ€λͺ] </summary>

#### 1οΈβ£ `DetailView` ν΄λμ€, `DetailImageCell` ν΄λμ€
- μν μμΈ νλ©΄μ Viewλ₯Ό κ·Έλ¦½λλ€.
    - UICollectionView, UIImageView, UILabel, UITextViewκ° StackView κ³μΈ΅μ λ΄κ²¨ μ€ν λ μ΄μμλ©λλ€.
    - μ μ²΄ νλ©΄μ΄ ScrollViewλ‘ μ΄λ£¨μ΄μ Έ μ»¨νμΈ κ° κΈΈμ΄μ§ μ νλ©΄μ μ€ν¬λ‘€ ν  μ μμ΅λλ€.
    - RegisterImageCellν΄λμ€λ imageCollectionViewμ Cellμ λ΄κΈΈ μ΄λ―Έμ§λ₯Ό μλ²μμ λ€μ΄λ°μμ΅λλ€.
#### 2οΈβ£ `CustomLabel` ν΄λμ€
- Viewμ μμλ€μ΄ initλ  λ, μμ±μ΄ λΆμ¬λ©λλ€.
#### 3οΈβ£ `DetailViewController`ν΄λμ€
- `DetailView`λ₯Ό μ»¨νΈλ‘€νκ³ , μλ²μ λ±λ‘λ μνμ μμΈμ λ³΄λ₯Ό λ°μμ νλ©΄μ νμν©λλ€.
- `showEditOrDeleteActionSheet` λ©μλ
    - μμ /μ­μ  λ©λ΄λ₯Ό λ³΄μ¬μ£Όλ μ‘μ μνΈλ₯Ό νλ©΄μ λ³΄μ¬μ€λλ€.
    - μμ λ©λ΄ ν΄λ¦­μ, λ€λΉκ²μ΄μμ»¨νΈλ‘€λ¬λ₯Ό ν΅ν΄ μμ νλ©΄μΌλ‘ μ΄λν©λλ€.
    - μ­μ λ©λ΄ ν΄λ¦­μ, νμ¬μ μνμ μ­μ ν©λλ€.
- `searchProductDeleteUri` λ©μλ, `deleteProduct(uri:)` λ©μλ
    - μ­μ λ₯Ό μν μνμ­μ  uriλ₯Ό μ‘°ννκ³ , uriλ₯Ό μ΄μ©ν΄ μλ²μ λ±λ‘λ μνμ μ­μ ν©λλ€.
</details>
</br>

## π­ κ³ λ―Όν λΆλΆ

<details>
<summary>[STEP 1 -κ³ λ―Όν λΆλΆ]</summary>

### 1οΈβ£ URLμ μ£Όμ μμ± λ°©λ²κ³Ό λ€μμ€νμ΄μ€
- μ£Όμμ quetyItmκ³Ό Pathλ§ λ³κ²½ν΄μ urlμ λ§λλ λ°©λ²μ κ³ λ―Όνμ΅λλ€.
- url μ£Όμμμ±μ `URLComponents`νμμ `extensionν΄` `path`μ `queryItems`λ₯Ό μ°κ²°νλ `makeUrl`λ©μλλ₯Ό μμ±νμ΅λλ€. 
- urlμ λ€μμ€νμ΄μ€λ‘ μ λ¦¬ν  λ `makeUrl` λ©μλλ₯Ό μ¬μ©νλλ°, argumentλ‘ μ£Όμμ λ³΄λ₯Ό μ λ¬ν΄μ€μΌνκΈ° λλ¬Έμ urlμ νμ μ°μ° νλ‘νΌν°λ‘ μ λ¦¬ν μ§, caseλ‘ μ λ¦¬ν μ§ κ³ λ―Όνμ΅λλ€.
- enumμ caseμμλ associated Value(μ°κ΄κ°)μ μ¬μ©ν  μ μμ΄μ `case productDetail(productNumber: Int)`μ κ°μ΄ μ¬μ©ν caseλ‘ μ λ¦¬νμ΅λλ€.

### 2οΈβ£ JSON snake_caseλ₯Ό CamelCaseλ‘ λ³ννλ λ°©λ²
- `Coding Key`μ `keyDecodingStrategy`λ₯Ό μ¬μ©νλ λ°©λ² μ€, `keyDecodingStrategy`λ₯Ό μ¬μ©νμ¬ `convertFromSnakeCase`λ₯Ό μ μ©νμμ΅λλ€.

### 3οΈβ£ DecodeTests μ λνμ€νΈ μ, νμ€νΈ μΌμ΄μ€ λ΄λΆλ₯Ό νμ§ μκ³  λ°λ‘ `success`λ‘ λ°νλλ λ¬Έμ λ₯Ό ν΄κ²°
- κΈ°μ κ³΅λ `products.json`νμΌμμ λ μ§ κ΄λ ¨λ νλ‘νΌν°μ νμμ `Date`λ‘ λ³κ²½νμ¬ μ£ΌκΈ° μν΄ `DateFormatter`λ₯Ό κ΅¬ννκ³  μ¬μ©νλλ°, STEP 1-2μμ μλ²μ ν΅μ νλ©΄μ λ°μμ€λ λ μ§ νμμ΄ λ¬λΌ `NSDataAsset`μ λμ½λ©νμ§ λͺ»ν΄μ μκΈ°λ λ¬Έμ μμ΅λλ€. β‘οΈ `Assets`μ λ±λ‘λ λ μ§ νμμ μλ²μ κ°κ² μμ νμ¬ μ£Όμμ΅λλ€.

</details>
<br>

<details>
<summary>[STEP 2 -κ³ λ―Όν λΆλΆ]</summary>

### 1οΈβ£ μΈλ€μΌ μ΄λ―Έμ§μ λΉλκΈ° μμ
- μλ²μμ κ°μ Έμ€λ μΈλ€μΌ μ΄λ―Έμ§μ urlκ°μ μ΄μ©ν΄ μ¬μ§μ λ£μ΄μ€ λ, `init(contentsOf:)`λ©μλλ₯Ό μ¬μ©ν΄ Dataλ₯Ό κ°μ Έμλλ° κ³΅μλ¬Έμμ λ€νΈμν¬ κΈ°λ° URLμ μ΄μ©ν΄ μ΄ λ©μλλ₯Ό μ¬μ© ν  λλ λΉλκΈ° μμμΌλ‘ μ²λ¦¬ν΄ μ£ΌλΌκ³  νμ¬ URLSessionμ μ΄μ©ν `fetchImage`λ©μλλ₯Ό λ§λ€μ΄ λΉλκΈ°λ‘ μ²λ¦¬νμ΅λλ€.

### 2οΈβ£ μκ΅¬μ¬ν­μ λ§μΆ° List Cellμ `>`μ μλ¨λ°°μΉ

|μκ΅¬μ¬ν­|Disclosure<br>μ΄μ© μ|
|:--:|:--:
|![](https://i.imgur.com/WbKY4EI.png)|![](https://i.imgur.com/XnSpod7.png)|

- μμ accessory `disclosure`λ₯Ό μ¬μ© μ μμ κ°μ΄λ°λ‘ νκΈ°λκ³ , μμΉλ₯Ό λ°κΏμ€ μκ° μμμ΅λλ€.
- accessoryλμ  `UIImageView`λ₯Ό μ΄μ©ν΄ μμ¬μλ labelκ³Ό μ°μΈ‘ '>' UIImageViewλ₯Ό `StackView`λ‘ λ΄μμ£Όκ³  Alignmentλ₯Ό `Top`μΌλ‘ μ€μ ν΄ μ£Όμμ΅λλ€.

### 3οΈβ£ ν λ μ΄λΈμ Stringμ λΆλΆμ μΌλ‘ ~~μ·¨μμ ~~κ³Ό μμμ λ°κΎΈλ λ°©λ²  
- μΈκ°μ§ λ°©λ²μ μ¬μ©ν΄λ³΄κ³  μ μ©μ΄ κ°λ₯ν `NSMutableAttributedString` μμ±μ μ¬μ©νμ΅λλ€
- μ²«λ²μ§Έλ‘ `AttributedString`μ extensionν΄ μμ±μ λ³κ²½νλ μλλ₯Ό νμ΅λλ€.
    β‘οΈ `AttributedString`κ³Ό κΈ°λ³Έ `String`νμμ΄ λ§μ§μμ νλ μ΄λΈμμ κ΅¬νμ΄ μ΄λ €μ μ΅λλ€.
- λλ²μ§Έλ‘, `UILabel`μ extentionνμ¬ labelμ μ μ©νλ λ°©λ²μ μλνμ΅λλ€.
    β‘οΈ GridViewμμ  μ¬μ©μ΄ κ°λ₯νμ§λ§ ListViewμμλ κΈ°λ³ΈCellμ μ¬μ©νλ€λ³΄λ labelμ μ§μ  μ κ·Όν  μ μμ΄ μ¬μ©μ΄ μ΄λ €μ μ΅λλ€.   
- μ΅μ’μ μΌλ‘  `NSMutableAttributedString`μ extentionνμ¬ μ·¨μμ κ³Ό μμ λ³κ²½μ νλλ‘ κ΅¬ννμ΅λλ€.
  β‘οΈ μΌλΆλ§ μμ±μ λ³κ²½ν΄μ€μΌ ν΄μ, μμ±λ³κ²½μ΄ μλ Stringνμμ `append`λ‘ μ°κ²°ν΄ μ¬μ©νμ΅λλ€.
    ```swift
    func strikethrough(string: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(NSMutableAttributedString.Key.strikethroughStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSMakeRange(0, attributedString.length))
        // ... μμ λμΌνκ² κΈμ¨μμ λΉ¨κ°μμΌλ‘ λ°κΎΈλ μμ± λΆμ¬
        return attributedString
    }

    func normal(string: String) -> NSMutableAttributedString {
        self.append(NSAttributedString(string: string))

        return self
    }
    ```

### 4οΈβ£ μ΄λ―Έμ§ λ€μ΄λ‘λ λλ μ΄μ νλ©΄ννλ°©λ²κ³Ό μΊμ±μμ
- μ΄λ―Έμ§λ€μ΄μ λΉλκΈ°μμμΌλ‘ μ΄λ―Έμ§ μ©λμ λ°λ₯Έ κ°κΈ°λ€λ₯Έ delayκ° μμμ΅λλ€
- μ²μμ `UIActivityIndicatorView`λ₯Ό μ΄μ©ν΄ μ΄λ―Έμ§ λ‘λ©μ νννκ³  μΆμμ΅λλ€ 
    β‘οΈ `UICollectionViewListCellμ` κΈ°λ³Έ μμΈ `.subtitleCell`μ μ¬μ©νλ κ΅¬μ±μ΄λΌ addSubViewλ, Viewλ μ΄λΈμ μ κ·Όμ΄ μ΄λ €μ κ³ , `UIListContentConfiguration`μ μ΄μ©ν΄ νΉμ±μ μ‘μμ€μΌνλλ° μ΄λ―Έμ§λ·°λμ  indicatorλ₯Ό λ£μ΄μ£Όλ €λ νμ λ¬Έμ μ, addSubViewκ° λμ§μλ λ¬Έμ κ° μμ΄ μ μ©νμ§ λͺ»νμ΅λλ€.
- `LaunchScreen`λ μκ°ν΄ λ³΄μμ΅λλ€. μ²μμ λ°μΉμ€ν¬λ¦°μ λΈμΆν΄ μ£Όκ³  λ°μ΄ν°λ₯Ό λ°μμ€λ μκ°μ λ²μ΄λ³΄λ € νλλ° λ³΄μ¬μ€ μ μλ μ λ³΄λ λ¨Όμ  λ³΄μ¬μ£Όλ κ²μ΄ μ’μ κ² κ°μ μ μ©μ λ³΄λ₯νμ΅λλ€.
- μ΅μ’μ μΌλ‘ , λ‘λ© image νλλ₯Ό AssetμΌλ‘ λ±λ‘νμ¬ μμμ κΉμ§ λ‘λ©μ΄λ―Έμ§κ° λ³΄μ΄λλ‘ μ²λ¦¬νμ΅λλ€
- λλΆμ΄ μμ μ±λ₯μ μν΄ μ΄λ―Έμ§λ₯Ό μΊμ±ν΄λλλ‘ νμ΅λλ€.
    
</details>
</br>

<details>
<summary>[STEP 3,4 -κ³ λ―Όν λΆλΆ]</summary>
    
### 1οΈβ£ μ¬μ§λ±λ‘ λ²νΌ (λ²νΌμΆκ° vs `collectionView(_:, didSelectItemAt:)`λ©μλ μ¬μ© )
- λ±λ‘ν μ¬μ§λ€μ λ³΄μ¬μ£Όλ νμ΄λΈλ·°λ₯Ό κ΅¬μ±ν  λ, μλ μ¬μ§μ λΉ¨κ° λ°μ€λΆλΆμ λ€λ₯Έ μλ€κ³Ό λ¬λ¦¬ ν°μΉ μ μ¨λ²μ λμμ£Όλ κΈ°λ₯μ κ°μ ΈμΌν΄μ κ΅¬νλ°©ν₯μ κ³ λ―Όνμ΅λλ€.
- Cellμ `Button`μ μΆκ°νλ λ°©λ²κ³Ό `collectionView(_:, didSelectItemAt:)` λ©μλλ₯Ό μ¬μ©ν μ§ κ³ λ―Όνκ³  νμμ λ°©λ²μΌλ‘ κ΅¬ννμ΅λλ€. μ ν°μΉ μ λ§μ§λ§ μμμ νμΈνκ³ , ImagePickerλ₯Ό λΆλ¬μ΅λλ€.
<img width = 300, src ="https://i.imgur.com/PyKLvKF.png">

### 2οΈβ£ μνλ±λ‘ ν λ¦¬μ€νΈ νλ©΄μΌλ‘ λμμ μλ°μ΄νΈ νμΈ
- μν λ±λ‘ νμ΄μ§μμ λ΄μ©μ μμ±νκ³  `Done` λ²νΌ ν°μΉ μ, ListViewμμ μλ‘­κ² μΆκ°λ μνμ΄ λΈμΆλμ§ μλ λ¬Έμ κ° μμμ΅λλ€.
    - MarketListViewControllerμμ `viewWillAppear`μ `fetchMarketData()`λ©μλλ₯Ό νΈμΆνμ¬ μ£Όλ©΄ ν΄κ²°λ  κ²μΌλ‘ μκ°νμ§λ§ λ±λ‘ ν λ°λ‘ λΈμΆλμ§ μκ³  μ±μ λ€μ μ€ννμ λ μ΄μ μ λ±λ‘λ μνμ΄ λΈμΆλμμ΅λλ€.
    - λλ²κΉ κ³Όμ  μ€ μν λ±λ‘μ΄ μλ£λκΈ° μ μ `fetchMarketData()`κ° λ¨Όμ  νΈμΆμ΄ λκ³  μμ΄μ `uploadProduct`λ©μλμμ `completionHandler`λ‘ λ±λ‘μ΄ μλ£λ  λκΉμ§ κΈ°λ€λ €μ£Όλλ‘ μ²λ¦¬νμμ΅λλ€.

### 3οΈβ£ UITextViewμ PlaceHolder μ μ©
- `UITextField`μ λ¬λ¦¬ `UITextView`μμλ PlaceHolderλ₯Ό μ§μνκ³  μμ§ μμ PlaceHolderλ₯Ό λ£μ΄μ£ΌκΈ° μν΄ κ³ λ―Όνμ΅λλ€.
    - μ²μμ textView.textμ `μμΈλ΄μ©` Stringμ λ£μ΄μ£Όκ³  μλ ₯μ΄ μμλ  λ UITextViewDelegateμ `textViewDidBeginEditing` λ©μλ μμ λ΄μ©μ μ§μμ£Όλ λ°©λ²μΌλ‘ κ΅¬ννμλ€κ°, μ΄ λ°©λ²μ μ²μ νλ©΄ λΈμΆ μμλ§ λ³΄μ¬μ§κ³  λ΄μ©μ μμ±ν ν λͺ¨λ μ§μ°κ³  λ€λ₯Έ μλ ₯ Fieldλ‘ μ΄λνλ©΄ λΈμΆλμ§ μλ λ¬Έμ κ° μμ΄ `textViewDidEndEditing` λ©μλμμ κ³΅λ°±κ³Ό μ€λ°κΏμ μ μΈν λ΄μ©μ΄ μμΌλ©΄ λ€μ PlaceHolderκ° λΈμΆλλλ‘ μμ νμμ΅λλ€.
        ```swift
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                textView.text = "μμΈλ΄μ©"
                textView.textColor = .systemGray3
            }
        }
        ```
        
### 4οΈβ£ DTO vs String
- HTTPRequest μμ± μ Bodyμ Dataλ₯Ό λ§λ€μ΄μ£Όλ κ³Όμ μμ `Dictionary`λ‘ Keyμ Valueλ₯Ό λ°λλ‘ κ΅¬μ±ν΄`forλ¬Έ`μΌλ‘ μ¬λ¬κ°μ TextBodyλ₯Ό λ§λ€μ΄μ μΆκ°νλλ‘ κ΅¬ννμ΅λλ€
- μ΄λ μ²μμ valueκ°μ `String`μΌλ‘ λ°λλ‘ κ΅¬ννμλλ°(textParameters: [String : String]), νλΌλ―Έν°λ‘ λ°λ νμ€νΈκ° μλμμκ°μ΄ κΈΈκ² μλ ₯λ°λ κ²μ΄ μ’μ§ μμ `Data`νμμ λ°λλ‘ μμ νκ³ ((textParameters: [String : Data])), `createProductFromUserInput` λ©μλλ₯Ό ν΅ν΄ Product νμμ μΈμ€ν΄μ€λ₯Ό μμ±νμ¬ μΈμ½λ©ν dataλ₯Ό Bodyμ μΆκ°νλλ‘ νμμ΅λλ€.
    ```swift
    //βοΈ μμ μ : String μ¬μ©
    { βnameβ: βtttβ,
    βdescriptionβ: βt1t1t1t1t1t1t1t1β,
    βpriceβ: 10000,
    βcurrencyβ: βKRWβ, βdiscounted_priceβ: 500,
    βstockβ: 1234567,
    βsecretβ: βsoobak1234β }`

    //β μμ  ν: DTOμ¬μ© ν Dataνμμ¬μ©
    let product = Product(name: βtttβ,
                              description: βt1t1t1t1t1t1t1t1β,
                              price: 10000,
                              currency: Currency.krw,
                              discountedPrice: 500,
                              stock: 1234567)
    guard let productData = try? encoder.encode(product) else { return }
    ```
</details>
</br>
    
## π νΈλ¬λΈ μν

### **π£ STEP 1**
### 1οΈβ£ DTO νμ μ¬μ¬μ©
- [μν λ¦¬μ€νΈ μ‘°ν]λ°μ΄ν°μμ νμ±ν΄μ€λ `Page`νμμ `Keyλͺ©λ‘`μ [μν μμΈμ‘°ν]νμ΄μ§μμ νμ±ν΄μ€λ `Page`νμμ Keyλͺ©λ‘μμ 3κ°μ§ keyκ° λλ½λμ΄μμ΄ `Page`νμμ μ¬μ¬μ©μ μμ΄ μλ¬κ° μμμ΅λλ€.<br><br>
- β **μμ : μ΅μλνμ μ€μ **
    - DTO μ¬μ¬μ©μ μν΄ λλ½ λμ΄μλ `description` / `images` / `vendor`  Keyλ₯Ό **μ΅μλνμ**μΌλ‘ μ§μ ν΄ μ μμ κ²½μ°μμλ νμ±νμ§ μκ³ , νμμ κ²½μ°μμ  νμ±ν  μ μκ² νμ΅λλ€.

### 2οΈβ£ Mock μ μ΄μ©ν Network Unit Testμ μ¬μ©ν  SampleDataμ mimeType μ€μ 
- `HTTPURLResponse`λ₯Ό MockμΌλ‘ μΈμ€ν΄μ€λ₯Ό λ§λ€μ΄ μ λνμ€νΈλ₯Ό ν  λ, mimeTypeμ΄ `nil`μ΄λΌ λ°μ΄ν°μ mimeTypeμ νμΈνλ λ‘μ§μ κ±Έλ € μλ¬κ° λλ λ¬Έμ κ° μμμ΅λλ€. 
- mimeTypeμ get μμ±μΌλ‘ μ½κΈ°μ μ©μ΄λΌ μΈμ€ν΄μ€ μμ± ν μΈλΆμμ μμ±κ°μ μ£Όμν  μ μμμ΅λλ€.<br><br>
- β **μμ : override**  
    - HTTPURLResponseλ₯Ό μμλ°λ MockHTTPURLResponseνμμ κ΅¬νν΄ mimeTypeνλ‘νΌν°λ₯Ό overrideν΄ serverμμ νμ±ν΄μ€λ `application/json`μ κ°μ κ°λλ‘νκ³ , MockHTTPURLResponseλ‘ μΈμ€ν΄μ€λ₯Ό μ¬μ©νμ΅λλ€ <br>
        ```swift
        final class MockHTTPURLResponse: HTTPURLResponse {
            override var mimeType: String {
                return "application/json"
            }
        }
        ```         
       
### 3οΈβ£ `fetchData(url:, type:, completionHandler:)`λ©μλλ‘ κ°μ Έμ¨ μλ²μ dataλ₯Ό ν¨μ μΈλΆλ‘ returnνλ λ²
- μ΄ λ©μλλ μλ²μμ dataλ₯Ό λ°μμ€λ κΈ°λ₯μ ν©λλ€. μ¦ νΈμΆ μ Dataλ₯Ό returnν΄ μ€μΌνλλ° λ©μλ λ΄λΆμμ μ¬μ©λλ ν΅μ¬ λ©μλμΈ dataTaskλ©μλμ CompletionHandlerλ₯Ό μ¬μ©ν΄μΌν΄μ returnνμμ κ΅¬ννλ λ° μ΄λ €μμ΄ μμμ΅λλ€
    - μ°μ  URLSessionμ dataTaskλ©μλμ returnνμμ΄ VoidνμμΌλ‘ μ§μ λμ΄μμμ΅λλ€
    - dataTaskλ©μλ μΈλΆμ λ³μμ dataλ₯Ό λ΄λ λ°©λ²μ ν΄λ‘μ μ κ° μΊ‘μ³ μμ±λλ¬Έμ λΆκ°λ₯νμ΅λλ€.<br><br>
- β **μμ : Resultνμμ¬μ©**
    - completionHandlerμ Result<Success, Failure>νμμ νλ‘νΌν°λ‘ κ°λ ν΄λ‘μ λ₯Ό μ¬μ©νμ΅λλ€.
    - dataTaskλ©μλ λ΄λΆμμ dataλ₯Ό .success(_)μ μ μ₯νλλ‘ νμ΅λλ€
    - μλ²ν΅μ  μμμ΄ λΉλκΈ°μ μ΄κΈ° λλ¬Έμ μμμ΄ μλ£λ ν νΈμΆλλ completionHandlerκ° μ μμλ λ  μ μλλ‘ @escaping ν€μλλ₯Ό μ¬μ©νμ΅λλ€.<br><br>
    ```swift
    func fetchData<T: Decodable>(url: URL,
                                 type: T.Type,
                                 completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        let dataTask = session.dataTask(with: url) { data, response, error in
            ...
            completionHandler(.success(decodedData))
        }
        
        dataTask.resume()
    } 
    ```
### **π£ STEP 2**
### 1οΈβ£ κΈ°λ³Έ μ΄λ―Έμ§κ° λ±λ‘λμ΄ μμ§ μμ λ‘λ© μ μμ ν¬κΈ°κ° κ°κ° λ€λ₯Έ λ¬Έμ 
- Modern Collection Viewsμμλ μμ μ¬μ΄μ¦κ° μλμΌλ‘ μ§μ λμ΄ Listλ·° λ‘λ© μ λ μ΄λΈμ ν¬κΈ°λ§νΌ μμ ν¬κΈ°κ° λ¨Όμ  μ ν΄μ§κ³  μ΄λ―Έμ§κ° λ‘λ©λλ©΄ μ΄νμ μμ΄ μ»€μ§λ©΄μ κ°κ° λ€λ₯Έ ν¬κΈ°μ μλ‘ μλλλ λ¬Έμ κ° μμμ΅λλ€.

    <img width = 200, src = "https://i.imgur.com/oN1iL7v.png"></br>

- β **μμ : PlaceHolderμ¬μ© λ° `reservedLayoutSize`μμ± μ¬μ©**
    - `content.imageProperties.reservedLayoutSize` νλ‘νΌν°λ₯Ό μ΄μ©ν΄ λ°λ μ¬μ΄μ¦λ₯Ό μ§μ ν΄μ£Όκ³  λ‘λ©λͺ¨μμ νμνλ μ΄λ―Έμ§λ₯Ό `PlaceHolder`λ‘ λ£μ΄μ£Όμ΄ μμ ν¬κΈ°κ° λ¨Όμ  μ‘νλλ‘ μ²λ¦¬νμ΅λλ€. <br>
        ```swift
        content.image = UIImage(named: "loading")
        content.imageProperties.reservedLayoutSize = CGSize(width: 70, height: 70)
        content.imageProperties.maximumSize = CGSize(width: 70, height: 70)
        ```

### 2οΈβ£ λΉ λ₯΄κ² μ€ν¬λ‘€ νμ λ Cellμ μμΉκ° λ€μ£½λ°μ£½ μμ΄λ λ¬Έμ 
- λ°μ΄ν°λ₯Ό μλ²μμ λΉλκΈ°λ‘ κ°μ Έμ€λ©΄μ Listμ Gridμμ μ€ν¬λ‘€μ λΉ λ₯΄κ² νμ λ, Cellμ μμΉκ° λ€μ£½λ°μ£½λκ³  λ€λ₯Έ μ΄λ―Έμ§κ° λ€μ΄μλ€κ° μμκ°μ λ€μ μ μμ΄λ―Έμ§κ° λμμ€λ λ±, Cellμ΄ μ μλ¦¬λ₯Ό μ°Ύμ§ λͺ»νλ λ¬Έμ κ° μμμ΅λλ€.

    <img width = 200, src = "https://i.imgur.com/xe6R3pE.gif"></br>

- β **μμ : indexPathκ° κ°μ λμλ§ Cellμ μ»¨νμΈ λ₯Ό κ΅¬μ±**
    - cell μ΄ μ μλ¦¬λ₯Ό μ°Ύμ μ μλλ‘ indexPathλ₯Ό μ΄μ©νμ΅λλ€.
    - `UICollectionView.CellRegistration`λ©μλμμ μ¬μ©ν  μ μλ `indexPath`κ°κ³Ό `UICollectionView`μ `indexPath` κ°μ΄ κ°μ λμλ§ cellμ contentλ₯Ό μμ±νλλ‘ νμμ΅λλ€.

- β **indexPath λΉκ΅λ₯Ό μν CompletionHandler μ μ©**
    - μ»¨νμΈ λ₯Ό κ΅¬μ±νλ κΈ°λ₯μ `configureCell` λ©μλμμ 3κ°μ§ `UICollectionView`, `Cellνμ`, `IndexPath` λ₯Ό λ§€κ°λ³μλ‘ λ°μμΌ λ©μλλ₯Ό μ¬μ©νλ κ³³μμ μ λ¬μΈμλ₯Ό μ΄μ©ν΄ λΉκ΅κ° κ°λ₯νμ΅λλ€.
    - λ§€κ°λ³μμ¬μ© λμ  `completionHandler` λ‘ `@escaping` ν΄λ‘μ λ₯Ό μ¬μ©ν΄ λ·°μ»¨μμ `indexPath`λ₯Ό λΉκ΅νλλ‘ κ΅¬ννμ΅λλ€. <br>
        ```swift
        // class MarketListCell
         func configureCell(page: Page,
                           completionHandler: @escaping (() -> Void) -> Void) {
         //  ... (μμ μ½νμΈ λ₯Ό κ΅¬μ±)
            DispatchQueue.main.async {
                let updateConfiguration = {
                    self.pageListContentView.configuration = content
                    }
                completionHandler(updateConfiguration)
            }
         }

        // class MarketListViewController
        private func configureDataSource() {
            let cellRegistration =    UICollectionView.CellRegistration<MarketListCell, Page> {
            (cell, indexPath, page) in
            cell.configureCell(page: page) { updateConfiguration in
                if indexPath == self.listView.indexPath(for: cell) {
                    updateConfiguration()
                }
            }
        //  ... 
        ```
### **π£ STEP 3, 4**
### 1οΈβ£ ν€λ³΄λ
1. λ±λ‘νλ©΄μμ TextViewμ μ ν μΈλΆμ λ³΄λ₯Ό μλ ₯ν  λ, Keyboardκ° μ½νμΈ λ₯Ό κ°λ¦¬λ λ¬Έμ κ° μμκ³ , μλ ₯μ΄ λλ ν ν€λ³΄λκ° λ΄λ €κ°μ§ μλ λ¬Έμ κ° μμμ΅λλ€.

- β **μμ 1: contentInsetμΆκ°μ, contentOffsetλ³κ²½**
    - ν€λ³΄λμ Notificationμ μ΄μ©ν΄ ν€λ³΄λκ° μ¬λΌμ¬ λ, ν€λ³΄λ λμ΄λ§νΌ λ·°κ° μλ‘ μ΄λν  μ μλλ‘ νμ΅λλ€.
    - μ μ²΄ λ·°λ₯Ό μ€ν¬λ‘€λ·°μ λ΄κ³ , ν€λ³΄λκ° μ¬λΌμ¬ λ νλ©΄ λ°μΌλ‘ ν€λ³΄λμ λμ΄λ§νΌ `contentInset`μ μΆκ°νκ³ , `contentOffset.y`μλ κ°μ κ°μ λν΄ μ»¨νμΈ λ₯Ό κ°λ¦¬μ§ μλ λ·°κ° λ³΄μ¬μ§λλ‘ κ΅¬ννμ΅λλ€.
    - μ΄ λ, μΈλΆμ λ³΄λ₯Ό μλ ₯νλ TextViewμμλ§ νλ©΄ μ΄λμ΄ λλλ‘ `isFirstResponder`λ₯Ό νμΈνμ΅λλ€.

- β **μμ 2: ν€λ³΄λλ₯Ό λ΄λ¦¬λ 3κ°μ§ λ°©μμ κ΅¬ν**
    - 1. μ€ν¬λ‘€ μ  
        - μ€ν¬λ‘€ λ·° Delegateμ `scrollViewWillBeginDragging`λ©μλλ₯Ό μ¬μ©νκ³ , λ΄λΆμμ `endEditing`λ©μλλ₯Ό μ¬μ©ν΄ ν€λ³΄λκ° λ΄λ €κ°λλ‘ νμ΅λλ€.
    - 2. μ¬λ°± ν°μΉ μ 
        - `addGestureRecognizer`λ₯Ό μ΄μ©ν΄ μ¬μ§μ λ³΄μ¬μ£Όλ νμ΄λΈλ·°λ₯Ό μ μΈν λλ¨Έμ§ λΉκ³΅κ° ν°μΉ μ ν€λ³΄λκ° λ΄λ €κ° μ μλλ‘ `UITapGestureRecognizer`λ₯Ό μ¬μ©νμ΅λλ€
    - 3. ν€λ³΄λ μλ¨ Doneλ²νΌ ν΄λ¦­ μ 
        - ν€λ³΄λμ `UIToolbar`λ₯Ό μΆκ°νκ³ , `Doneλ²νΌ`μ λ§λ€μ΄ ν°μΉ μ ν€λ³΄λκ° λ΄λ €κ° μ μλλ‘ νμ΅λλ€.


</br>
    
## π μ°Έκ³  λ§ν¬

[κ³΅μλ¬Έμ]
- [URLSession](https://developer.apple.com/documentation/foundation/urlsession)
- [Fetching Website Data into Memory](https://developer.apple.com/documentation/foundation/url_loading_system/fetching_website_data_into_memory)
- [URLComponents](https://developer.apple.com/documentation/foundation/urlcomponents)
- [queryItems](https://developer.apple.com/documentation/foundation/urlcomponents/1779966-queryitems)
- [JSONDecoder.KeyDecodingStrategy](https://developer.apple.com/documentation/foundation/jsondecoder/keydecodingstrategy)
- [Implementing Modern Collection Views](https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views)
- [UICellAccessory](https://developer.apple.com/documentation/uikit/uicellaccessory?changes=latest_major)
- [WWDC2020 - Advances in UICollectionView](https://developer.apple.com/videos/play/wwdc2020/10097)
- [WWDC2020 - Lists in UICollectionView](https://developer.apple.com/videos/play/wwdc2020/10026)
- [Asynchronously Loading Images into Table and Collection Views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/asynchronously_loading_images_into_table_and_collection_views)
- [NSMutableAttributedString](https://developer.apple.com/documentation/foundation/nsmutableattributedstring)
- [NSCache](https://developer.apple.com/documentation/foundation/nscache)

[κ·Έ μΈ μ°Έκ³ λ¬Έμ]
- [λ€νΈμν¬ μνμ λ¬΄κ΄ν νμ€νΈλ₯Ό μμ±νλ λ°©λ²](https://velog.io/@dacodaco/iOS-%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC-%EC%83%81%ED%83%9C%EC%99%80-%EB%AC%B4%EA%B4%80%ED%95%9C-%ED%85%8C%EC%8A%A4%ED%8A%B8%EB%A5%BC-%EC%9E%91%EC%84%B1%ED%95%98%EB%8A%94-%EB%B0%A9%EB%B2%95)
- [λ€νΈμν¬μ λ¬΄κ΄ν URLSession Unit Test](https://wody.tistory.com/10)
- [Modern Collection Views with Compositional Layouts](https://www.kodeco.com/5436806-modern-collection-views-with-compositional-layouts#toc-anchor-004)
- [Modern Collection View - List κ΅¬ν](https://leechamin.tistory.com/555#Modern%--Collection%--View%--%EA%B-%AC%ED%--%--)
- [Cell configuration](https://velog.io/@leeyoungwoozz/iOS-Cell-configuration)
- [μ΄λ―Έμ§ μΊμ± μ¬μ©ν΄λ³΄κΈ°](https://hryang.tistory.com/29)

