// Pet sample

public abstract class Pet
{
    public abstract string GetAngry();

    public static void Main(string[] args)
    {
        Pet pet = new Cat();
        System.Console.WriteLine(pet.GetAngry());
    }
}

public class Cat : Pet
{
    public override string GetAngry()
    {
        return @"ネコがひっかく";
    }
}

public class Dog : Pet
{
    public override string GetAngry()
    {
        return @"イヌがほえる";
    } 
}

