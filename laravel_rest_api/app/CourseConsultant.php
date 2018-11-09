<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CourseConsultant extends Model
{
    protected $guarded = ['id', 'created_at', 'update_at'];
    protected $table = 'consultant';
    protected $hidden = ['id', 'created_at', 'updated_at'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'avatar'
    ];

    public function course(){
        return $this->belongsTo(Course::class);
    }
}
