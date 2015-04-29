import java.util.HashMap;
import java.util.Map;
import java.lang.Integer;
import java.lang.Thread;


public class MemLeak {
	private static final Map<String, Object> CACHE = new HashMap<String, Object>();
	public static void main(String[] args) throws InterruptedException {
		for (int i = 0; i < 10; i++) {
			System.out.print("Mem-");
			System.out.println(Integer.toString(i));
			CACHE.put(Integer.toString(i), new byte[100000000]);
			Thread.sleep(2000);
		}
	}
}
