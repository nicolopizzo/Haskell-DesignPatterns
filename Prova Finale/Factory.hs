module Factory where

data Employee = Employee | TeamManager 

getSalary :: Employee -> Int
getSalary Employee = 1200
getSalary TeamManager = 1400

{- Poichè il principale scopo del factory pattern è quello di delegare l'istanziazione dell'oggetto alle sottoclassi,
   andando effettivamente a nascondere al client l'istanziazione, secondo un paradigma funzionale tale pattern non ha senso di esistere.
   Ciò è vero in quanto non si ha la concezione di "istanziazione" di un oggetto, ma piuttosto si modellano e usano singole istanze di tipo
   di dato. Dunque da un punto di vista puramente funzionale, la firma di una Factory sarebbe () -> a, che altro non è che a. -}