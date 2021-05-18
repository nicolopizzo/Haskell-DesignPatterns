data Shape = Shape {shapeX::Int, shapeY::Int, shapeColor::Color} deriving (Show)
data Color = Red | Green | Blue deriving (Show)

data Rectangle = Rectangle {shapeRectangle::Shape, w::Int, h::Int} deriving (Show)
data Circle = Circle {shapeCircle::Shape, radius::Int} deriving (Show)

class HasColor a where
    color :: a -> Color

instance HasColor Shape where color = shapeColor
instance HasColor Rectangle where color = shapeColor . shapeRectangle
instance HasColor Circle where color = shapeColor . shapeCircle