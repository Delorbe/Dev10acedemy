public class Exercise14 {
    public static void main(String[] arg) {
        int gradeLevel = 12;
        boolean isASenior = gradeLevel == 12;
        boolean isInterestedInVoulenteering;
        boolean shouldSendVoulenteerInfo = isASenior && isInterestedInVoulenteering;

        System.out.println(shouldSendVoulenteerInfo);
    }
}
