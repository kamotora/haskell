import Lib
import Test.HUnit

test1 = TestCase (assertEqual "[[]] => []" ([] :: [Int]) (intersection ([[]] :: [[Int]])))

test2 = TestCase (assertEqual "[[],[],[]] => []" ([] :: [Int]) (intersection ([[], [], []] :: [[Int]])))

test3 = TestCase (assertEqual "[1,2] && [3,4] && [5,6] => []" [] (intersection [[1, 2], [3, 4], [5, 6]]))

test4 = TestCase (assertEqual "[1,2,3,4,5,6,7,8], [3,4,5,6,7,8], [7, 3, 1, 2] => [3,7]" [3, 7] (intersection [[1, 2, 3, 4, 5, 6, 7, 8], [3, 4, 5, 6, 7, 8], [7, 3, 1, 2]]))

test5 = TestCase (assertEqual "[1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3] , [1,1,1,1,1,3,3,3,3,3], [2,2,2,2,2,2,2,2,1,3,3,3,3,3,3,3] => [1,3]" [1,3] (intersection [[1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3] , [1,1,1,1,1,3,3,3,3,3], [2,2,2,2,2,2,2,2,3,1,3,3,3,3,3,3]]))

test6 = TestCase (assertEqual "[True, True, False], [False, True, False], [True, True] = [True]" [True] (intersection [[True, True, False], [False, True, False], [True, True]]))

test7 = TestCase (assertEqual "[1,2,3,4,5] => [1,2,3,4,5]" [1, 2, 3, 4, 5] (intersection [[1, 2, 3, 4, 5]]))

test8 = TestCase (assertEqual "[1,2,3,4,5], [], [1,2,3,4,5] => []" [] (intersection [[1, 2, 3, 4, 5], [], [1, 2, 3, 4, 5]]))

test9 = TestCase (assertEqual "[1,2,3,4,5], [1,2,3,4,5] => [1,2,3,4,5]" [1, 2, 3, 4, 5] (intersection [[1, 2, 3, 4, 5], [1, 2, 3, 4, 5]]))

tests =
  TestList
    [ TestLabel "test1" test1,
      TestLabel "test2" test2,
      TestLabel "test3" test3,
      TestLabel "test4" test4,
      TestLabel "test5" test5,
      TestLabel "test6" test6,
      TestLabel "test7" test7,
      TestLabel "test8" test8,
      TestLabel "test9" test9
    ]

main :: IO ()
main = do
  runTestTT tests
  putStrLn "Success!"
