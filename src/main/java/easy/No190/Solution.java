package easy.No190;

/**
 * @Author bbbojack
 * @Date 2023/10/27 09:41
 */
public class Solution {

    public int reverseBits(int n) {

        int res = 0;
        for (int i = 0; i < 32 && n != 0; i++) {
            res |= (n & 1) << (32 - i) - 1;
            n >>>= 1;
        }
        return res;
    }

    // 慢
    public int reverseBits1(int n) {
        StringBuilder num = new StringBuilder(Integer.toBinaryString(n));
        num.reverse();
        while (num.length() < 32) {
            num.append(0);
        }
        return Integer.parseUnsignedInt(num.toString(), 2);
    }

}