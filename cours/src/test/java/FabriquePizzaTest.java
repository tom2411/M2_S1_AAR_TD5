import org.junit.Test;

import java.util.Map;
import java.util.function.Function;
import java.util.function.Supplier;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.catchThrowable;

public class FabriquePizzaTest {

    // tag::code[]
    interface Pizza {};
    class PizzaFromage implements Pizza {};
    class PizzaVegetarienne implements Pizza {};

    Pizza psingleton = new PizzaFromage();
    private Map<String, Supplier<Pizza>> fabRegistre = Map.of(
            "fromage", PizzaFromage::new,
            "végétarienne", PizzaVegetarienne::new,
            "singleton", ()-> psingleton
    );
    private Function<String, Pizza> fabrique =
            nom -> fabRegistre.getOrDefault(nom,
                    () -> { throw new IllegalArgumentException("Unknown " + nom); })
                    .get();
    // end::code[]

    // tag::tests[]
    @Test
    public void testFabFromage() {
        Pizza pizza = fabrique.apply("fromage");
        assertThat(pizza).hasSameClassAs(new PizzaFromage());
    }
    @Test
    public void testFabVegetarienne() {
        Pizza pizza = fabrique.apply("végétarienne");
        assertThat(pizza).hasSameClassAs(new PizzaVegetarienne());
    }
    @Test
    public void testFabException() {
        // WHEN
        Throwable thrown = catchThrowable(() -> fabrique.apply("calzone"));
        // THEN
        assertThat(thrown).isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining("calzone");
    }
    // end::tests[]
    @Test
    public void testFabSingleton() {
        Pizza p1 = fabrique.apply("singleton");
        Pizza p2 = fabrique.apply("singleton");
        assertThat(p1).isSameAs(p2);
    }
    @Test
    public void testFabExceptionNull() {
        // WHEN
        Throwable thrown = catchThrowable(() -> fabrique.apply(null));
        // THEN
        assertThat(thrown).isInstanceOf(NullPointerException.class);
    }
}
