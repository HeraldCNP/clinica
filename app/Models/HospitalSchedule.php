<?php

namespace App\Models;

use Eloquent;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;

/**
 * App\Models\HospitalSchedule
 *
 * @property int $id
 * @property string $day_of_week
 * @property string $start_time
 * @property string $end_time
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|HospitalSchedule newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|HospitalSchedule newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|HospitalSchedule query()
 * @method static \Illuminate\Database\Eloquent\Builder|HospitalSchedule whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|HospitalSchedule whereDayOfWeek($value)
 * @method static \Illuminate\Database\Eloquent\Builder|HospitalSchedule whereEndTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|HospitalSchedule whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|HospitalSchedule whereStartTime($value)
 * @method static \Illuminate\Database\Eloquent\Builder|HospitalSchedule whereUpdatedAt($value)
 * @mixin Eloquent
 */
class HospitalSchedule extends Model
{
    use HasFactory;

    const Mon = 1;
    const Tue = 2;
    const Wed = 3;
    const Thu = 4;
    const Fri = 5;
    const Sat = 6;
    const Sun = 7;

    const WEEKDAY = [
        self::Mon => 'LUN',
        self::Tue => 'MAR',
        self::Wed => 'MIE',
        self::Thu => 'JUE',
        self::Fri => 'VIE',
        self::Sat => 'SAB',
        self::Sun => 'DOM',
    ];
    const WEEKDAY_FULL_NAME = [
        self::Mon => 'Lunes',
        self::Tue => 'Martes',
        self::Wed => 'Miércoles',
        self::Thu => 'Jueves',
        self::Fri => 'Viernes',
        self::Sat => 'Sábado',
        self::Sun => 'Domingo',
    ];
    public $fillable = [
        'day_of_week',
        'start_time',
        'end_time',
    ];
    protected $table = 'hospital_schedules';
}
